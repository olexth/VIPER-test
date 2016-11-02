//
//  DataManager.swift
//  ViperTest
//
//  Created by Alex Golub on 10/31/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    static let sharedInstance = DataManager()
    fileprivate init() {}

    // MARK: Core Data stack

    lazy var managedObjectContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ViperTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
