//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAME___
import XCTest

class ___FILEBASENAMEASIDENTIFIER___RouterTests: XCTestCase {
    private var sut: ConfirmLegalRouter!

    override func setUp() {
        super.setUp()
        sut = ___FILEBASENAMEASIDENTIFIER___Router()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

fileprivate class DummyViewController: ___FILEBASENAMEASIDENTIFIER___ViewController {
    var didInvokePerformSegueWithIdentifier = false
    var segueIdentifier: String?
    private override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        didInvokePerformSegueWithIdentifier = true
        segueIdentifier = identifier
    }
}
