//
//  Item.swift
//  Lister
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Item {
    let title: String
    let completed = false

    init(_ title: String) {
        self.title = title
    }
}
