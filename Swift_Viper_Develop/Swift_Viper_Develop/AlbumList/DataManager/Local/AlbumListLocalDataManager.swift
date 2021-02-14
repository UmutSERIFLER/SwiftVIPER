//
//  AlbumListLocalDataManager.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import CoreData

class AlbumListLocalDataManager: AlbumListLocalDataManagerInputProtocol {
   
    func retrieveAlbumList() throws -> [Album]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }

        let request: NSFetchRequest<Album> = NSFetchRequest(entityName: String(describing: Album.self))

        return try managedOC.fetch(request)
     
    }
    
    func saveAlbum(artist: String, mbid: String, name: String, streamable: String, url: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }

        if let newAlbum = NSEntityDescription.entity(forEntityName: "AlbumCDM",
                                                           in: managedOC) {
            let album: Album = Album(entity: newAlbum, insertInto: managedOC)
            
//            album.artist = artist
//            album.mbid = mbid
//            album.name = name
//            album.streamable = streamable
//            album.url = url
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
    }
    
}
