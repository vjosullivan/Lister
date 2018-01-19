//
//  ToDoListManager.swift
//  VOSToDo
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class ToDoListManager {

    // MARK: - Local constants and variables.

    private var items = [ToDo]()

    // MARK: - Properties.

    public var itemCount: Int {
        return items.count
    }

    // MARK: - Init functions.

    init() {
        for i in 1...3 {
            items.append(ToDo("Item \(i)."))
        }
    }

    // MARK: - Public functions

    public func item(_ index: Int) -> String? {
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index].title
    }
    
    public func addItem(completion: () -> ()) {
        items.append(ToDo("New item \(items.count + 1)."))
        completion()
    }
}
