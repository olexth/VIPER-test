//
//  MasterRouterTests.swift
//  ViperTest
//
//  Created by Alex Golub on 11/26/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

@testable import ViperTest
import XCTest

class MasterRouterTests: XCTestCase {
    private var sut: ConfirmLegalRouter!

    override func setUp() {
        super.setUp()
        sut = MasterRouter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

fileprivate class DummyViewController: MasterViewController {
    var didInvokePerformSegueWithIdentifier = false
    var segueIdentifier: String?
    private override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        didInvokePerformSegueWithIdentifier = true
        segueIdentifier = identifier
    }
}
