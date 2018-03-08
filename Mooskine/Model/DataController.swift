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
    //4.convenience property to access the context
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName:String) {
        //2.instantiate it
        persistentContainer = NSPersistentContainer(name: modelName)
        
        
    }
    //3.Load the persistant store
    func load(completion:(() -> Void)? = nil){
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            //if there is an error loading the store
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            //we may want to pass in a function to get called after loading the store
            //call the auto-saving function > initial autosave
            self.autoSaveViewContext()
            completion?()
        }
    }
}

extension DataController {
    //16.2
    func autoSaveViewContext(interval:TimeInterval = 30) {
        print("autosaving")
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }
        //check if there are changes that need to be saved
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        //call the function again after the specified interval has elapsed
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
