//
//  AppDelegate.swift
//  2020-CCCC-Works
//
//  Created by 温蟾圆 on 2020/5/24.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openCamera()
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "_020_CCCC_Works")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func openCamera() {
        let cameraViewController = CameraViewController()
        cameraViewController.sourceType = .camera
        cameraViewController.allowsEditing = true
        cameraViewController.delegate = cameraViewController
        self.window?.rootViewController = cameraViewController
    }

}

