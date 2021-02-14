//
//  SearchAlbumMatchModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

// MARK: - SearchAlbumMatchModel
struct SearchAlbumMatchModel: Decodable {
    let album: [SearchAlbumModel]
}

extension SearchAlbumMatchModel {
    func convertToAlbumModelArray() -> [AlbumModel] {
        var albumModelArray : [AlbumModel] = []
        self.album.forEach { (album) in
            albumModelArray.append(AlbumModel(artist: album.artist, name: album.name, url: album.url, streamable: album.streamable, mbid: album.mbid))
        }
        return albumModelArray
    }
}
