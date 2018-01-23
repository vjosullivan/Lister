//
//  ItemViewController.swift
//  Lister
//
//  Created by Vincent O'Sullivan on 23/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    // MARK: - Local constants and variables.

    private let item: Item

    // MARK: - Outlets.

    @IBOutlet weak var itemTitle: UILabel!

    // MARK: - Init functions.

    init(item: Item? = nil) {
        self.item = item ?? Item("A New Item")

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented in ItemViewController.")
    }

    // MARK: - UIView lifecycle functions.

    override func viewDidLoad() {
        super.viewDidLoad()

        let saveButton = UIBarButtonItem(title: "Save",   style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = "New Item"
        itemTitle.text = item.title
    }
}
