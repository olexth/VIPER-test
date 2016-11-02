//
//  FetchedTableViewDataSource.swift
//  ViperTest
//
//  Created by Alex Golub on 10/30/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit
import CoreData

class FetchedTableViewDataSource: NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    weak var tableView: UITableView!

    // MARK: TableView DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let event = self.fetchedResultsController.object(at: indexPath)
        self.configureCell(cell, withEvent: event)
        return cell
    }

    // MARK: Actions

    func insertNewObject() {
        let context = self.fetchedResultsController.managedObjectContext
        let newEvent = Event(context: context)
        newEvent.timestamp = NSDate()
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func deleteObjectAt(indexPath: IndexPath) {
        let context = self.fetchedResultsController.managedObjectContext
        context.delete(self.fetchedResultsController.object(at: indexPath))
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func eventAt(indexPath: IndexPath) -> Event {
        return self.fetchedResultsController.object(at: indexPath)
    }

    // MARK:  Fetched Results Controller

    fileprivate var fetchedResultsController: NSFetchedResultsController<Event> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataManager.sharedInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return _fetchedResultsController!
    }
    fileprivate var _fetchedResultsController: NSFetchedResultsController<Event>? = nil

    // MARK: NSFetchResultsControllerDelegate

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            self.tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            self.tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            self.configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }

    // MARK: Utils

    func configureCell(_ cell: UITableViewCell, withEvent event: Event) {
        cell.textLabel!.text = event.timestamp!.description
    }
}
