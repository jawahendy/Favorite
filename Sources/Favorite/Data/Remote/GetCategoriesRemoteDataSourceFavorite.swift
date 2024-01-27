//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
import Core
import Combine
import Alamofire


public struct GetCategoriesFavRemoteDataSource : DataSourceFavorite {
    
  public typealias Request = Any

  public typealias Response = [CategoryFavoritResponses]

  private let _endpoint: String

  public init(endpoint: String) {
    _endpoint = endpoint
  }
    
    public func getCategoriesFavorite(request: Request?) -> AnyPublisher<[CategoryFavoritResponses], Error> {
      return Future<[CategoryFavoritResponses], Error> { completion in
        if let url = URL(string: _endpoint) {
          AF.request(url,headers: ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjdhYTZjYWJmMzg4ODM5NmEyZTVjN2JjZDEzYTRjYyIsInN1YiI6IjYyNTZjNTJjMGMyNzEwMDIyOTVkOTgyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zv3FvPx_J7__Mt2wyFZC4dXZ8NwW94dyO2F-TlqZHaA",
                                   "Content-Type": "application/json"])
            .validate()
            .responseDecodable(of: CategoriesFavoritResponses.self) { response in
              switch response.result {
              case .success(let value):
                completion(.success(value.results))
              case .failure:
                completion(.failure(URLError.invalidResponse))
              }
            }
        }
      }.eraseToAnyPublisher()
    }
}
