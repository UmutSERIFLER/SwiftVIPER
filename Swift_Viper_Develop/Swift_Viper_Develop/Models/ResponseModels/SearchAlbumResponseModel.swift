//
//  SearchAlbumResponseModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

struct SearchAlbumResponseModel: Decodable {
    let results: SearchAlbumResponseResultModel
}

struct SearchAlbumResponseResultModel: Decodable {
    let opensearchQuery: SearchQueryModel
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let albummatches: SearchAlbumMatchModel
    let attr: SearchAttrModel
    
    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }
}
