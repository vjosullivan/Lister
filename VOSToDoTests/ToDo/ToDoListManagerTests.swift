//
//  ToDoListManagerTests.swift
//  VOSToDoTests
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import VOSToDo

class ToDoListManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testCreatable() {
        let manager = ToDoListManager()
        XCTAssertNotNil(manager)
    }

    func testInvalidIndex() {
        let manager = ToDoListManager()

        // First, confirm that at least one item exists.
        XCTAssertTrue(manager.itemCount >= 0)

        // Test.
        XCTAssertNil(manager.item(-99))

        let highIndex = manager.itemCount + 1
        XCTAssertNil(manager.item(highIndex))

    }
}
