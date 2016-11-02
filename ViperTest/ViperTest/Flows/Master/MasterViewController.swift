//
//  MasterViewController.swift
//  ViperTest
//
//  Created by Alex Golub on 10/29/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol MasterViewControllerInput: MasterPresenterOutput {
}

protocol MasterViewControllerOutput {
    func setupDataSourceWith(tableView: UITableView)
    func insertNewObject()
    func deleteObjectAt(indexPath: IndexPath)
    func eventAt(indexPath: IndexPath) -> Event
}

final class MasterViewController: UITableViewController, MasterViewControllerInput {
    var output: MasterViewControllerOutput!
    var router: MasterRouter!
    var detailViewController: DetailViewController? = nil

    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        ViperConfigurator.configure(viewController: self,
            interactorType: MasterInteractor.self,
            presenterType: MasterPresenter.self,
            routerType: MasterRouter.self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        output.setupDataSourceWith(tableView: tableView)

        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedEvent = output.eventAt(indexPath: indexPath)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.event = selectedEvent
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: Event handling

    func insertNewObject(_ sender: Any) {
        output.insertNewObject()
    }

    // MARK: Display logic=
}

extension MasterViewController {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteObjectAt(indexPath: indexPath)
        }
    }
}

extension MasterViewController: ViperViewController {
    func setOutput(output: ViperInteractor){
        self.output = output as! MasterViewControllerOutput
    }

    func setRouter(router: ViperRouter) {
        self.router = router as! MasterRouter
    }
}
