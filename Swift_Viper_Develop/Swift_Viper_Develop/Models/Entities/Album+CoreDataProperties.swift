//
//  Album+CoreDataProperties.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation
import CoreData

extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "AlbumCDM");
    }

    @NSManaged public var artist: String?
    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var streamable: String?
    @NSManaged public var mbid: String?

}
