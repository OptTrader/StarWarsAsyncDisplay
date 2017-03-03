//
//  AppDelegate.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/16/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        
        let filmFeedVC = FilmFeedViewController()
        let swapiService = SwapiService()
        
        let dataManager = FilmFeedDataManager(swapiService: swapiService)
        let interactor = FilmFeedInteractor()
        interactor.dataManager = dataManager
        interactor.output = filmFeedVC
        
        filmFeedVC.handler = interactor
        
        let filmFeedNavController = UINavigationController(rootViewController: filmFeedVC)
        window.rootViewController = filmFeedNavController
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}
