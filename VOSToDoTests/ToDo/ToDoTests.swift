//
//  ToDoTests.swift
//  VOSToDoTests
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import VOSToDo

class ToDoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testToDoCreatable() {
        let text = "Perform unit tests."
        let todo = ToDo(text)
        XCTAssertNotNil(todo)
        XCTAssertEqual(text, todo.title)
    }
}
