//
//  LastFMAPI.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 13/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation

public enum LastFMAPI {
    case searchAlbum(name: String)
}

fileprivate enum LastFMServiceTitles: String {
    case searchAlbum = "method=album.search"
}

extension LastFMAPI: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: Credential.BaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var servicePath: String {
        switch self {
        case .searchAlbum(let albumName):
            return LastFMServiceTitles.searchAlbum.rawValue + "&album=\(albumName)"
        }
    }
    
    var path: String {
        return "\(servicePath)&format=json&api_key=\(Credential.API)"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .searchAlbum:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .searchAlbum:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
