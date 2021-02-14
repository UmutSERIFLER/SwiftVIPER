//
//  UIView+Extension.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 14/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import UIKit

extension UIView {
    class var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
