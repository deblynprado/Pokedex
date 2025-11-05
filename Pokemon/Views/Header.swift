//
//  Header.swift
//  Pokemon
//
//  Created by Deblyn Prado on 05/05/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
       ZStack {
           VStack {
               HStack {
                   Image("pokeball")
                       .padding(.trailing, 20)
                    Text("Pokédex")
                       .font(.largeTitle)
                       .bold()
                   Spacer()
               }
               .foregroundColor(.white)
               .padding()
               
               HStack {
                   HStack {
                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.pokeApiDefault)
                       TextField("Search", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                   }
                   .padding()
                   .frame(height: 30)
                   .background(Color.white)
                   .cornerRadius(10)
               }
               .padding()
           }
           
        }
       .frame(maxWidth: .infinity)
       .background(Color.red)
    }
}

#Preview {
    Header()
}
