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
    
    @StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
//            LoginView()
        }
    }
}
