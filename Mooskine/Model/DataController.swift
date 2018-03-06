//
//  DataController.swift
//  Mooskine
//
//  Created by Polina Fiksson on 06/03/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    //1.hold a persistant container instance
    let persistentContainer:NSPersistentContainer
    
    init(modelName:String) {
        //2.instantiate it
        persistentContainer = NSPersistentContainer(name: modelName)
        //4.convenience property to access the context
        var viewContext:NSManagedObjectContext {
            return persistentContainer.viewContext
        }
    }
    //3.Load the persistant store
    func load(completion:(() -> Void)? = nil){
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            //if there is an error loading the store
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            //we may want to pass in a function to get called after loading the store
            completion?()
        }
    }
}
