//
//  AlbumTableViewCell.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    
    // Update Model
    var album: AlbumModel? {
        didSet {
           print(album)
            self.updateCellUI()
        }
    }
    
    func updateCellUI() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: .default, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    func set(forAlbum album: SearchAlbumModel) {
//        self.selectionStyle = .none
//        titleLabel?.text = album.artist
//    }
}
