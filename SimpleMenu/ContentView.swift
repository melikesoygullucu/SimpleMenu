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
    let colors: [String: Color] = [ "D": .purple , "G": .black, "N": .red, "S": .blue, "V": .green]
    // G stands for Gluten, V stands for Vegeterian and so on.
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                    
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                
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
