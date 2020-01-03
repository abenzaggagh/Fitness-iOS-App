//
//  Persistable.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/29/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation
import CoreData

protocol Persistable {
    
    var context: NSManagedObjectContext { get }
    var container: NSPersistentContainer { get }
    
    func save()
    
}
