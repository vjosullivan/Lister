//
//  AppDelegate.swift
//  VOSToDo
//
//  Created by Vincent O'Sullivan on 19/01/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        let listManager = ToDoListManager()
        nav1.pushViewController(ListViewController(todoListManager: listManager), animated: true)
        self.window!.rootViewController = nav1
        self.window?.makeKeyAndVisible()

        return true
    }
}

