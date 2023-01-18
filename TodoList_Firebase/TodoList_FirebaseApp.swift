//
//  TodoList_FirebaseApp.swift
//  TodoList_Firebase
//
//  Created by HyeonHo on 2023/01/18.
//

import SwiftUI
import Firebase

@main
struct TodoList_FirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
