//
//  MasterViewControllerTests.swift
//  ViperTest
//
//  Created by Alex Golub on 11/26/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

@testable import ViperTest
import XCTest

class MasterViewControllerTests: XCTestCase {
    fileprivate var sut: SkillsViewController!

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

fileprivate class DummyRouter: MasterRouterInput {
    var didInvokePassDataToNextScene = false
    func passDataToNextScene(segue: UIStoryboardSegue) {
        didInvokePassDataToNextScene = true
    }

    var didInvokePassDataToNextSceneWithSender = false
    private func passDataToNextScene(segue: UIStoryboardSegue, sender: AnyObject?) {
        didInvokePassDataToNextSceneWithSender = true
    }
}
