//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
import Core


public struct CategoryTransformerFavorite: MapperFavorite {

        
  public typealias Response = [CategoryFavoritResponses]
  public typealias Domain = [CategoryfavoritsModels]

  public init() {}

    public func transformEntityToDomainFav(entity: [CategoryFavoritResponses]) -> [CategoryfavoritsModels] {
      return entity.map { result in
          return CategoryfavoritsModels(
            adult: result.adult,
            backdropPath: result.backdrop_path ?? "",
            id: result.id ?? 0,
            originalLanguage: result.original_language ?? "",
            originalTitle: result.original_title ?? "",
            overview: result.overview ?? "",
            popularity: result.popularity ?? 0,
            posterPath: result.poster_path ?? "",
            releaseDate: result.release_date ?? "",
            title: result.title ?? "",
            voteAverage: result.vote_average ?? 0,
            voteCount: result.vote_count ?? 0
          )
      }
    }

}
