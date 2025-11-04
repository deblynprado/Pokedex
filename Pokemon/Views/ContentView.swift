//
//  ContentView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Header()
        
        NavigationStack {
            List(viewModel.pokemons) { pokemon in
                ZStack {
                    NavigationLink(String()) {
                        DetailView(pokemon: pokemon, pokemons: $viewModel.pokemons)
                    }
                    .opacity(1)
                    PokemonCard(pokemon: pokemon)
                }
                .listRowSeparator(.hidden)
                .swipeActions {
//                    Button("Excluir") {
//                        pokemons.removeAll {
//                            $0.id == pokemon.id
//                        }
//                    }
                    
                    Button(role: .destructive, action: {
                        print("Remove Pokémon")
                    }) {
                        Label("Remove", systemImage: "trash")
                    }
                }
            }
            .listStyle(.plain)
            .onAppear() {
                Task {
                    await viewModel.fetchPokemons()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
