//
//  transylvanian_tomeApp.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import SwiftUI
import Firebase

@main
struct transylvanian_tomeApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

