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
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
            
        }
        
    }
}

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading){
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

#Preview {
    ContentView()
}
