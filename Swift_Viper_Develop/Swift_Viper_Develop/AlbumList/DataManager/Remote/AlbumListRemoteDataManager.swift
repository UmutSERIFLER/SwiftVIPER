//
//  AlbumListRemoteDataManager.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation

class AlbumListRemoteDataManager: AlbumListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: AlbumListRemoteDataManagerOutputProtocol?
    
    func retrieveAlbumList() {
        LastFMAPIProvider().searchAlbum(name: "A") { (result) in
            switch result {
            case .success(let success):
                print()
                self.remoteRequestHandler?.onAlbumsRetrieved(success.results.albummatches.convertToAlbumModelArray())
            case .failure(_):
                self.remoteRequestHandler?.onError()
            }
        }
    }
    
}
