//
//  AlbumListPresenter.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

class AlbumListPresenter: AlbumListPresenterProtocol {
    
    weak var view: AlbumListViewProtocol?
    var interactor: AlbumListInteractorInputProtocol?
    var wireFrame: AlbumListWireFrameProtocol?
    
    func viewDidLoad() {
        //view?.showLoading()
        interactor?.retrieveAlbumList()
    }
    
    func showAlbumDetail(forAlbum album: AlbumModel) {
        wireFrame?.presentAlbumDetailScreen(from: view!, forAlbum: album)
    }
}

extension AlbumListPresenter: AlbumListInteractorOutputProtocol {
  
    func didRetrieveAlbums(_ albums: [AlbumModel]) {
        //view?.hideLoading()
        view?.reloadAlbumsView(with: albums)
    }
    
    func onError() {
        //view?.hideLoading()
        view?.showError(with: "Change HERE to Object")
    }
    
}


