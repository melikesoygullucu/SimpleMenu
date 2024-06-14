//
//  ItemDetail.swift
//  SimpleMenu
//
//  Created by Melike Soygüllücü on 13.06.2024.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo \(item.photoCredit)")
                    .padding()
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
           
            Text(item.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    
    }
}

#Preview {
    NavigationStack{
        ItemDetail(item: MenuItem.example)
    }
}
