//
//  AppDelegate.swift
//  swifty_companion
//
//  Created by Heidi Merianne on 5/10/23.
//  Copyright © 2023 Heidi Merianne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let authManager: IAuthManager = AuthManager()
    private lazy var appRouter: IAppRouter = AppRouter(with: authManager)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        
        appRouter.startApp(in: window)
        return true
    }
}


