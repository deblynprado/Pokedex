//
//  PokemonCard.swift
//  Pokemon
//
//  Created by Deblyn Prado on 13/05/25.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("#000")
            }
            .padding(10)
            
            AsyncImage(
                url: pokemon.cover.image,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(pokemon.data.name)
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemGray6))
                    .frame(height: 56)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 0)
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(.white)
        .cornerRadius(16)
        .listRowSeparator(.hidden)
        .shadow(
            color: .dropShadow,
            radius: 10,
            x: 0,
            y: 0
        )
    }
}

#Preview {
    PokemonCard(pokemon: .init(data: .init(
        name: "Bulbasaur",
//        types: ["grass"]
    ),
                   cover: .init(indexImage: 1),
                   typeColor: .init(apiType: "grass"))
    )
}
