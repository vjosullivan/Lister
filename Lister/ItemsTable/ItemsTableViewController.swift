//
//  ItemsTableViewController.swift
//  Lister
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ItemsTableViewController: UIViewController {
    
    // MARK: - Local constants and variables.
    
    private let itemsManager: ItemsManager
    
    // MARK: - Outlets.
    
    @IBOutlet weak var itemsTable: UITableView!
    
    // MARK: - Init functions.
    
    init(itemsManager: ItemsManager) {
        self.itemsManager = itemsManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented in ItemsTableViewController.")
    }
    
    // MARK: - UIView lifecycle functions.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "ItemsTableViewCell", bundle: nil)
        itemsTable.register(nib, forCellReuseIdentifier: "ItemCell")
        
        let addButton = UIBarButtonItem.init(title: "New Item", style: .plain, target: self, action: #selector(addNewItem))
        navigationItem.rightBarButtonItem = addButton
        
        itemsTable.dataSource = self
        itemsTable.delegate   = self
    }
    
    @objc
    func addNewItem() {
        print("Adding new item.")
        edit()
    }

    /// Presents an editing screen for a new or existing item.
    ///
    /// - Parameter item: (Optional) The `Item` to be edited.  If no item is given then a new item will be created.
    ///
    private func edit(_ item: Item? = nil) {
        print("Editing \(item?.title ?? "Untitled Task").")
        // TODO: Important - Refactor this code to use view-state drven architecture.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        navigationController!.pushViewController(ItemViewController(itemsManager: itemsManager, itemID: item?.ID), animated: true)
    }
}

extension ItemsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: Remove magic number.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsManager.itemCount
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
        self.itemsManager.removeItem(indexPath.row) {
            self.itemsTable.reloadData()
        }
    }
    
    private func editHandler(_ action: UITableViewRowAction, _ indexPath: IndexPath) {
        print("Edit button tapped")
        edit(itemsManager.item(indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTable.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemsTableViewCell
        cell.title.text = itemsManager.item(indexPath.row)?.title ?? ""
        
        return cell
    }
}

extension ItemsTableViewController: UITableViewDelegate {
    
}
