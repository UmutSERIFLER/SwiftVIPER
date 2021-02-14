//
//  AlbumListView.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import UIKit

class AlbumListView: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.keyboardDismissMode = .onDrag
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
       return tableView
    }()
    var presenter: AlbumListPresenterProtocol?
    var albumModels: [AlbumModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension AlbumListView: AlbumListViewProtocol {
    func reloadAlbumsView(with albums: [AlbumModel]) {
        
        DispatchQueue.main.async {
            self.view.addSubview(self.tableView)
            self.tableView.translatesAutoresizingMaskIntoConstraints = false
            self.tableView.frame = self.view.frame
            self.albumModels = albums
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
    
    func showError(with message: String) {
        
    }
    
    
    
}

extension AlbumListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as! AlbumTableViewCell
//
//        let album = albumModels[indexPath.row]
//       // cell.album = album
//
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showAlbumDetail(forAlbum: albumModels[indexPath.row])
    }
    
}
