//
//  IDineApp.swift
//  SimpleMenu
//
//  Created by Melike Soygüllücü on 14.06.2024.
//

import SwiftUI

@main
struct IDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(order)
        }
    }
}

