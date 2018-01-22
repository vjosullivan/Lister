//
//  ItemTests.swift
//  ListerTests
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Lister

class ItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testItemCreatable() {
        let text = "Perform unit tests."
        let item = Item(text)
        XCTAssertNotNil(item)
        XCTAssertEqual(text, item.title)
    }
}
