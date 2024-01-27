//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation


public struct CategoryfavoritsModels: Equatable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let id: Int?
    public let originalLanguage: String?
    public let originalTitle, overview: String?
    public let popularity: Double?
    public let posterPath, releaseDate, title: String?
    public let voteAverage: Double?
    public let voteCount: Int?
}
