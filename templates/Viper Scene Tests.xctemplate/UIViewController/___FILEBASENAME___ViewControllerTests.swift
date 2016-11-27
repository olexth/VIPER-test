//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAME___
import XCTest

class ___FILEBASENAMEASIDENTIFIER___ViewControllerTests: XCTestCase {
    fileprivate var sut: ___FILEBASENAMEASIDENTIFIER___ViewController!

    override func setUp() {
        super.setUp()
        sut = StoryboardScene.Flow.viewController()
        let _  = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.router, "view controller should have router instantiated")
        XCTAssertNotNil(sut.output, "view controller should have output instantiated")
    }
}

fileprivate class DummyRouter: ___FILEBASENAMEASIDENTIFIER___RouterInput {
    var didInvokePassDataToNextScene = false
    func passDataToNextScene(segue: UIStoryboardSegue) {
        didInvokePassDataToNextScene = true
    }

    var didInvokePassDataToNextSceneWithSender = false
    private func passDataToNextScene(segue: UIStoryboardSegue, sender: AnyObject?) {
        didInvokePassDataToNextSceneWithSender = true
    }
}
