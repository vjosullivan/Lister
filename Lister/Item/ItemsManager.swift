//
//  ItemsManager.swift
//  Lister
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

typealias OptionalCompletion = (() -> Void)?

class ItemsManager {

    // MARK: - Local constants and variables.

    private var items = [Item]()

    // MARK: - Properties.

    public var itemCount: Int {
        return items.count
    }

    // MARK: - Init functions.

    init() {
        for i in 1...3 {
            items.append(Item("Item \(i)."))
        }
    }

    // MARK: - Public functions

    public func item(_ index: Int) -> String? {
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index].title
    }
    
    public func addItem(completion: OptionalCompletion = nil) {
        items.append(Item("Sample item \(items.count + 1)."))
        completion?()
    }
    
    public func removeItem(_ index: Int, completion: OptionalCompletion = nil) {
        items.remove(at: index)
        completion?()
    }
}
