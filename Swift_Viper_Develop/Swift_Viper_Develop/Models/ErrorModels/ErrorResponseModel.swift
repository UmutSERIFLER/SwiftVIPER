//
//  ErrorResponseModel.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 13/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation

struct ErrorResponseModel: Decodable, Error {
    var error: Int
    var message: String
}
