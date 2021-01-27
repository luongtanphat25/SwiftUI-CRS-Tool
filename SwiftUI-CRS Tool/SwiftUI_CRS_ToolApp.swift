//
//  SwiftUI_CRS_ToolApp.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-15.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct SwiftUI_CRS_ToolApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var score = Score()
    var body: some Scene {
        WindowGroup {
            ContentView(delegate: self.delegate)
                .environmentObject(score)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
    @Published var isShowAlert = false
    @Published var title = ""
    @Published var message = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            isShowAlert = true
            title = "Error"
            message = error.localizedDescription
        } else {
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { [self] (authResult, error) in
                if let error = error {
                    isShowAlert = true
                    title = "Error"
                    message = error.localizedDescription
                } else {
                    isShowAlert = true
                    title = "Sign in successfully"
                    message = "Thank you for sign in. We will connect you soon."
                }
            }
        }
    }
}
