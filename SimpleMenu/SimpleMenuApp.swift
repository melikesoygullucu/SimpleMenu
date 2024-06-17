//
//  SimpleMenuApp.swift
//  SimpleMenu
//
//  Created by Melike Soygüllücü on 12.06.2024.
//

import SwiftUI

@main
struct SimpleMenuApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
