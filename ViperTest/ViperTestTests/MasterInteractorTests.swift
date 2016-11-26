//
//  MasterInteractorTests.swift
//  ViperTest
//
//  Created by Alex Golub on 11/26/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

@testable import ViperTest
import XCTest

class MasterInteractorTests: XCTestCase {
    fileprivate var sut: Master!
    fileprivate var dummyOutput: DummyOutput!

    override func setUp() {
        super.setUp()
        sut = Master()
        dummyOutput = DummyOutput()
        sut.output = dummyOutput
    }

    override func tearDown() {
        dummyOutput = nil
        sut = nil
        super.tearDown()
    }
}

private class DummyOutput: MasterOutput {
    var didInvokeFunction = false
    func function() {
        didInvokeFunction = true
    }
}
