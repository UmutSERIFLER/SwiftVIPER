//
//  LastFMAPIProvider.swift
//  Swift_Viper
//
//  Created by Umut SERIFLER on 13/02/2021.
//  Copyright © 2021 UmutSERIFLER. All rights reserved.
//

import Foundation

fileprivate enum LastFMErrorTypes {
    case noNetwork
    case invalidData
    case unknownError(message: String)
    
    func getError() -> ErrorResponseModel {
        switch self {
        case .noNetwork:
            return ErrorResponseModel(error: 0, message: "No Network")
        case .invalidData:
            return ErrorResponseModel(error: 0, message: "Invalid Data")
        case .unknownError(let message):
            return ErrorResponseModel(error: 0, message: "\(message)")
        }
    }
}

protocol LastFMAPIProviderProtocol {
    func genericParser<M>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completionHandler: @escaping (Result<M, ErrorResponseModel>) -> ()) where M : Decodable
    func searchAlbum(name: String, completionHandler: @escaping (Result<SearchAlbumResponseModel, ErrorResponseModel>) -> ())
}


/// Zalando API Provider
struct LastFMAPIProvider: LastFMAPIProviderProtocol {
    
    
    let router = Router<LastFMAPI>()
    
    /// Generic Parser Method for Decodable formats
    /// - Parameters:
    ///   - data: Taken Data from Model
    ///   - response: URL Response
    ///   - error: Custom Error
    ///   - completionHandler: handler for closure
    /// - Returns: Decodable/Error
    func genericParser<M>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completionHandler: @escaping (Result<M, ErrorResponseModel>) -> ()) where M : Decodable {
        if error != nil {
            completionHandler(.failure(LastFMErrorTypes.noNetwork.getError()))
        }
        if let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode {
            guard let responseData = data else {
                completionHandler(.failure(LastFMErrorTypes.invalidData.getError())) // Data is nil
                return
            }
            do {
                let decodedModel = try JSONDecoder().decode(M.self, from: (String(data: responseData, encoding: .utf8)?.replacingOccurrences(of: "\'", with: "", options: .literal, range: nil).data(using: .utf8)!)!)
                completionHandler(.success(decodedModel))
            } catch  {
                do {
                    let error = try JSONDecoder().decode(ErrorResponseModel.self, from: responseData)
                    completionHandler(.failure(error))
                } catch {
                    completionHandler(.failure(LastFMErrorTypes.invalidData.getError()))
                }
            }
        } else {
            guard let errorData = data else {
                completionHandler(.failure(LastFMErrorTypes.invalidData.getError()))
                return
            }
            do {
                let error = try JSONDecoder().decode(ErrorResponseModel.self, from: errorData)
                completionHandler(.failure(error))
            } catch {
                completionHandler(.failure(LastFMErrorTypes.unknownError(message:"Parse Error").getError()))
            }
            
        }
    }
    
    func searchAlbum(name: String, completionHandler: @escaping (Result<SearchAlbumResponseModel, ErrorResponseModel>) -> ()) {
        router.request(.searchAlbum(name: name)) { (data, response, error) in
            self.genericParser(data, response, error) { (result) in
                completionHandler(result)
            }
        }
    }
    
    
}

