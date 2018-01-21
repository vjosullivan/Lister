//
//  ListViewController.swift
//  VOSToDo
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Local constants and variables.
    
    private var listManager = ToDoListManager()
    
    // MARK: - Outlets.
    
    @IBOutlet weak var todoList: UITableView!
    
    // MARK: - UIView lifecycle functions.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem.init(title: "New Item", style: .plain, target: self, action: #selector(addToDoItem))
        navigationItem.rightBarButtonItem = addButton
        
        todoList.dataSource = self
        todoList.delegate   = self
    }
    
    @objc
    func addToDoItem() {
        listManager.addItem() {
            self.todoList.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: Remove magic number.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ABX")
        return listManager.itemCount
    }
    
    @available(iOS 8.0, *)
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // action one
        let editButton = UITableViewRowAction(style: .default, title: "Edit", handler: editHandler)
        editButton.backgroundColor = UIColor.blue

        // action two
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete", handler: deleteHandler)
        deleteButton.backgroundColor = UIColor.red
        
        return [deleteButton, editButton]
    }
    
    private func deleteHandler(_ action: UITableViewRowAction, _ indexPath: IndexPath) {
        print("Delete button tapped")
        self.listManager.removeItem(indexPath.row) {
            self.todoList.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private func editHandler(_ action: UITableViewRowAction, _ indexPath: IndexPath) {
        print("Edit button tapped")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoTableViewCell
        cell.title.text = listManager.item(indexPath.row)
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
}
