//
//  MasterInteractor.swift
//  ViperTest
//
//  Created by Alex Golub on 10/29/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit
import CoreData

protocol MasterInteractorInput: MasterViewControllerOutput {
}

protocol MasterInteractorOutput {
}

final class MasterInteractor: MasterInteractorInput {
    var output: MasterInteractorOutput!
    fileprivate var dataSource: FetchedTableViewDataSource!

    init(withDataSource dataSource: FetchedTableViewDataSource = FetchedTableViewDataSource()) {
        self.dataSource = dataSource
    }

    func setupDataSourceWith(tableView: UITableView) {
        dataSource.tableView = tableView
        dataSource.tableView.dataSource = dataSource
    }

    // MARK: Business logic

    func insertNewObject() {
        dataSource.insertNewObject()
    }

    func deleteObjectAt(indexPath: IndexPath) {
        dataSource.deleteObjectAt(indexPath: indexPath)
    }

    func eventAt(indexPath: IndexPath) -> Event {
        return dataSource.eventAt(indexPath: indexPath)
    }
}

extension MasterInteractor: ViperInteractor {
    convenience init(withOutput: ViperPresenter) {
        self.init()
        self.output = withOutput as! MasterInteractorOutput
    }
}
