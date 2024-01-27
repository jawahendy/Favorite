//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation


public struct CategoriesFavoritResponses: Decodable {

    public let results: [CategoryFavoritResponses]

}

//public struct AddFavortResponse: Decodable {
//
//  let results: [AddsFavortResponse]
//
//}


public struct CategoryFavoritResponses: Decodable {
    public let adult: Bool?
    public let backdrop_path: String?
    public let id: Int?
    public let original_language: String?
    public let original_title, overview: String?
    public let popularity: Double?
    public let poster_path, release_date, title: String?
    public let vote_average: Double?
    public let vote_count: Int?
}

//public struct AddsFavortResponse: Decodable {
//    let success: Bool?
//    let status_message: String?
//    let status_code: Int?
//}
