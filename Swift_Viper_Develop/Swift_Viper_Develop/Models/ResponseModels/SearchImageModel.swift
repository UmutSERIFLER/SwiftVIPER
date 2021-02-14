//
//  SearchImageModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

// MARK: - SearchImageModel
struct SearchImageModel: Decodable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
    
    enum Size: String, Decodable {
        case extralarge = "extralarge"
        case large = "large"
        case medium = "medium"
        case small = "small"
    }
}
