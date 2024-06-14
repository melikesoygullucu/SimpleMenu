//
//  ContentView.swift
//  SimpleMenu
//
//  Created by Melike Soygüllücü on 12.06.2024.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(menu){ section in
                    Section(section.name){
                        ForEach(section.items){ item in
                            NavigationLink(value: item){
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self){ item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
    
        }
    }
}


#Preview {
    ContentView()
}
