//
//  ViewController.swift
//  VOSToDo
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Local constants and variables.

    private var listManager = ToDoListManager()

    // MARK: - Outlets.

    @IBOutlet weak var todoList: UITableView!

    // MARK: - UIView lifecycle functions.

    override func viewDidLoad() {
        super.viewDidLoad()

        todoList.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: Remove magic number.
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listManager.itemCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "ToDoCell")!
        cell.textLabel?.text = listManager.item(indexPath.row)

        return cell
    }
}
