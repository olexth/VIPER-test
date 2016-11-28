//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAME___
import XCTest

class ___FILEBASENAMEASIDENTIFIER___InteractorTests: XCTestCase {
    fileprivate var sut: ___FILEBASENAMEASIDENTIFIER___Interactor!
    fileprivate var dummyOutput: DummyOutput!

    override func setUp() {
        super.setUp()
        sut = ___FILEBASENAMEASIDENTIFIER___Interactor()
        dummyOutput = DummyOutput()
        sut.output = dummyOutput
    }

    override func tearDown() {
        dummyOutput = nil
        sut = nil
        super.tearDown()
    }
}

private class DummyOutput: ___FILEBASENAMEASIDENTIFIER___InteractorOutput {
    var didInvokeFunction = false
    func function() {
        didInvokeFunction = true
    }
}
