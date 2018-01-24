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


    /// If found, returns an existing item with the given ID otherwise `nil`.
    ///
    /// - Parameter id: The ID of the item to be returned.
    /// - Returns: The specified item.
    ///
    public func item(withID soughtID: UUID) -> Item? {
        for item in items {
            if item.ID == soughtID { return item }
        }
        return nil
    }

    public func item(_ index: Int) -> Item? {
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index]
    }
    
    public func addItem(completion: OptionalCompletion = nil) {
        items.append(Item("Sample item \(items.count + 1)."))
        completion?()
    }
    
    public func removeItem(_ index: Int, completion: OptionalCompletion = nil) {
        items.remove(at: index)
        completion?()
    }

    public func update(_ item: Item) {
        print("Manager: updating database with item \(item.ID).")
        if itemExists(withID: item.ID) {
            print("Item already exists.")
            updateExisting(item)
        } else {
            print("Item is new.")
            addNew(item)
        }
    }

    // MARK: - Private functions.

    private func itemExists(withID soughtID: UUID) -> Bool {
        for item in items {
            if item.ID == soughtID { return true }
        }
        return false
    }

    private func updateExisting(_ item: Item) {
        print("Updating existing item.")
    }

    private func addNew(_ item: Item) {
        print("Adding new item.")
    }
}
