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

    private var items = [ToDo]()

    // MARK: - Outlets.

    @IBOutlet weak var todoList: UITableView!

    // MARK: - UIView lifecycle functions.

    override func viewDidLoad() {
        super.viewDidLoad()

        todoList.dataSource = self

        for i in 1...3 {
            items.append(ToDo("Item \(i)."))
        }
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "ToDoCell")!
        cell.textLabel?.text = items[indexPath.row].title

        return cell
    }
}
