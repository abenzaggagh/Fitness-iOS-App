//
//  Networkable.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/28/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

protocol Networkable {
    
    func request(url path: String, completion: @escaping (Result<Data, Error>) -> Void)

}
