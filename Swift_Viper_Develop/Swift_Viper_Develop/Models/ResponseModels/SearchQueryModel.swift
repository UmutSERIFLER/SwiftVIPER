//
//  SearchQueryModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

// MARK: - SearchQueryModel
struct SearchQueryModel: Decodable {
    let text: String
    let role, searchTerms, startPage: String
    
    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }
}
