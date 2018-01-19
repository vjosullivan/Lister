//
//  ToDo.swift
//  VOSToDo
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct ToDo {
    let title: String
    let completed = false

    init(_ title: String) {
        self.title = title
    }
}
