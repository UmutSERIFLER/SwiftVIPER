//
//  AlbumListViewProtocol.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import UIKit

protocol AlbumListViewProtocol: class {
    var presenter: AlbumListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func reloadAlbumsView(with albums:[AlbumModel])
    func showError(with message: String)
    
}

protocol AlbumListWireFrameProtocol: class {
    static func createAlbumListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentAlbumDetailScreen(from view: AlbumListViewProtocol, forAlbum album: AlbumModel)
    
}

protocol AlbumListPresenterProtocol: class {
    var view: AlbumListViewProtocol? { get set }
    var interactor: AlbumListInteractorInputProtocol? { get set }
    var wireFrame: AlbumListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showAlbumDetail(forAlbum album: AlbumModel)
}

protocol AlbumListInteractorInputProtocol: class {
    var presenter: AlbumListInteractorOutputProtocol? { get set }
    var localDatamanager: AlbumListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AlbumListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveAlbumList()
}

protocol AlbumListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveAlbums(_ albums: [AlbumModel])
    func onError()
}

protocol AlbumListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol AlbumListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: AlbumListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveAlbumList()
}

protocol AlbumListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onAlbumsRetrieved(_ albums: [AlbumModel])
    func onError()
}

protocol AlbumListLocalDataManagerInputProtocol: class {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrieveAlbumList() throws -> [Album]
    func saveAlbum(artist: String, mbid: String, name: String, streamable: String, url: String) throws
}
