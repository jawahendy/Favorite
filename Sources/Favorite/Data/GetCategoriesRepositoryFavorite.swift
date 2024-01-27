//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
import Core
import Combine


public struct GetCategoriesFavorRepository<
  RemoteDataSource: DataSourceFavorite,
  Transformer: MapperFavorite>: RepositoryFavorite
where
// 2
RemoteDataSource.Response == [CategoryFavoritResponses],
Transformer.Response == [CategoryFavoritResponses],
Transformer.Domain == [CategoryfavoritsModels] {

  // 3
  public typealias Request = Any
  public typealias Response = [CategoryfavoritsModels]

  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer

  public init(
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {

      _remoteDataSource = remoteDataSource
      _mapper = mapper
    }

  // 4
  public func executefav(request: Any?) -> AnyPublisher<[CategoryfavoritsModels], Error> {
    return _remoteDataSource.getCategoriesFavorite(request: nil)
      .flatMap { result -> AnyPublisher<[CategoryfavoritsModels], Error> in
        if result.isEmpty {
          return _remoteDataSource.getCategoriesFavorite(request: nil)
            .catch { _ in _remoteDataSource.getCategoriesFavorite(request: nil) }
            .flatMap { _ in _remoteDataSource.getCategoriesFavorite(request: nil)
                .map { _mapper.transformEntityToDomainFav(entity: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return _remoteDataSource.getCategoriesFavorite(request: nil)
            .map { _mapper.transformEntityToDomainFav(entity: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
}
