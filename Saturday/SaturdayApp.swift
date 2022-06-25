//
//  SaturdayApp.swift
//  Saturday
//
//  Created by Titus Lowe on 19/5/22.
//

import SwiftUI
import FirebaseCore

/* Adding Firebase Initialisation Code */
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct SaturdayApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            let user = UserLoginModel()

            if user.signedIn == false {
                WelcomeView()
                    .environmentObject(user)
            }
//            SplitView()
//                .environmentObject(user)
//            ContentView()
//                .environmentObject(user)
//            HomeView(friends: friendListU)
//                .environmentObject(user)
//            TextExtractionView()
        }
    }
}
