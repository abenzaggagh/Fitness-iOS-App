//
//  NetworkService.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/29/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

class NetworkService: Networkable {
    
    private init() {
    
    }
    
    static let shared = NetworkService()
    
    func request(url path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: path)!
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            if let unwrappedError = error {
                completion(.failure(unwrappedError as Error))
            } else if let unwrappedData = data {
                completion(.success(unwrappedData))
            }
        }
        
        task.resume()        
    }
    
}
