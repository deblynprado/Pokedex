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
        }
       .frame(maxWidth: .infinity)
       .background(Color.red)
    }
}

#Preview {
    Header()
}
