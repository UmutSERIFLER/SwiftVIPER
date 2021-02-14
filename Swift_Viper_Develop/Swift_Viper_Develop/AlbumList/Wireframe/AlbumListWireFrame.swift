//
//  AlbumListWireFrame.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import UIKit

class AlbumListWireFrame: AlbumListWireFrameProtocol {
   
    class func createAlbumListModule() -> UIViewController {
        let view = AlbumListView()
        let presenter: AlbumListPresenterProtocol & AlbumListInteractorOutputProtocol = AlbumListPresenter()
        let interactor: AlbumListInteractorInputProtocol & AlbumListRemoteDataManagerOutputProtocol = AlbumListInteractor()
        let localDataManager: AlbumListLocalDataManagerInputProtocol = AlbumListLocalDataManager()
        let remoteDataManager: AlbumListRemoteDataManagerInputProtocol = AlbumListRemoteDataManager()
        let wireFrame: AlbumListWireFrameProtocol = AlbumListWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
    
    func presentAlbumDetailScreen(from view: AlbumListViewProtocol, forAlbum album: AlbumModel) {
        //        let postDetailViewController = AlbumDetailWireFrame.createPostDetailModule(forPost: post)
        //
        //        if let sourceView = view as? UIViewController {
        //           sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        //        }
    }
    
}
