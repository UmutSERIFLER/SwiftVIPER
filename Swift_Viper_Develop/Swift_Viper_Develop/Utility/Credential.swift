//
//  Credential.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 12/02/2021.
//

import Foundation

class Credential {
    static private(set) var API : String = ""
    static private(set) var SharedSecret : String = ""
    static private(set) var BaseURL: String = ""
    static func readValues() {
        if let url = Bundle.main.url(forResource: "Keys", withExtension: "json") {
            do {
                let keysData = try JSONDecoder().decode(Keys.self, from: Data(contentsOf: url))
                API = keysData.Keys.API
                SharedSecret = keysData.Keys.SharedSecret
                BaseURL = keysData.Keys.BaseURL
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
