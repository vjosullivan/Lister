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
    
    var manager: ToDoListManager?

    override func setUp() {
        super.setUp()

        // Setup code.
        manager = ToDoListManager()

    }
    
    override func tearDown() {
        // Teardown code.
        manager = nil

        super.tearDown()
    }
    
    func testCreatable() {
        XCTAssertNotNil(manager)
    }

    func testInvalidIndex() {

        // First, confirm that at least one item exists.
        XCTAssertTrue(manager!.itemCount >= 0)

        // Test.
        XCTAssertNil(manager!.item(-99))

        let highIndex = manager!.itemCount + 1
        XCTAssertNil(manager!.item(highIndex))

    }

    func testAddItemAddsItem() {
        let initialCount = manager!.itemCount
        manager!.addItem()
        XCTAssertEqual(initialCount + 1, manager!.itemCount)
    }

    func testAddItemCallsCompletion() {
        var completionCalled = false
        manager!.addItem { completionCalled = true }
        XCTAssertTrue(completionCalled)
    }

    func testRemoveItemRemovesItem() {
        manager!.addItem()
        let initialCount = manager!.itemCount
        manager!.removeItem(0)
        XCTAssertEqual(initialCount - 1, manager!.itemCount)
    }

    func testRemoveItemCallsCompletion() {
        var completionCalled = false
        manager!.addItem()
        manager!.removeItem(0) { completionCalled = true }
        XCTAssertTrue(completionCalled)
    }
}
