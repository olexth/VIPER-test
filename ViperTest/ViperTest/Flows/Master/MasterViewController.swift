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

final class MasterViewController: UIViewController, MasterViewControllerInput {
    var output: MasterViewControllerOutput!
    var router: MasterRouter!
    var detailViewController: DetailViewController? = nil

    @IBOutlet weak var tableView: UITableView!

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
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedEvent = output.eventAt(indexPath: indexPath)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.event = selectedEvent
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: Event handling

    @IBAction func didPress(addButton: UIBarButtonItem) {
        output.insertNewObject()
    }

    @IBAction func didPress(editButton: UIBarButtonItem) {

    }

    // MARK: Display logic
}

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteObjectAt(indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
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
