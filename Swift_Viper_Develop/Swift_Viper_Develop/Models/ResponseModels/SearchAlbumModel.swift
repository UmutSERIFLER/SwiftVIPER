//
//  SearchAlbumModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

// MARK: - SearchAlbumModel
struct SearchAlbumModel: Decodable {
    let name, artist: String
    let url: String
    let image: [SearchImageModel]
    let streamable, mbid: String
}
