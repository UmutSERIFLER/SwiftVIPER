//
//  NSObject+Extension.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 14/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation

extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
