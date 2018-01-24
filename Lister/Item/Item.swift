//
//  Item.swift
//  Lister
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

/// Represents anything that can appear in a list such as a "To Do" list, shopping list, task list, etc.
struct Item {

    /// Unique item identifier.
    let ID: UUID
    /// The main descriptive title or header for this item.
    let title: String

    init(_ title: String) {
        self.ID    = UUID()
        self.title = title
    }
}
