//
//  AlbumListInteractor.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//
import Foundation

class AlbumListInteractor: AlbumListInteractorInputProtocol {
    
    weak var presenter: AlbumListInteractorOutputProtocol?
    var localDatamanager: AlbumListLocalDataManagerInputProtocol?
    var remoteDatamanager: AlbumListRemoteDataManagerInputProtocol?
    
    
    func retrieveAlbumList() {
        DispatchQueue.main.async {
            self.remoteDatamanager?.retrieveAlbumList()
        }
        
//        do {
////            if let albumList = try localDatamanager?.retrieveAlbumList() {
////
////            }
//
//        } catch {
//            presenter?.didRetrieveAlbums([])
//        }
    }
        
}

extension AlbumListInteractor: AlbumListRemoteDataManagerOutputProtocol {
 
    
    func onAlbumsRetrieved(_ albums: [AlbumModel]) {
        presenter?.didRetrieveAlbums(albums)
        for album in albums {
            do {
                try localDatamanager?.saveAlbum(artist: album.artist, mbid: album.mbid, name: album.name, streamable: album.streamable, url: album.url)
            } catch {
            
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
