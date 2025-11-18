//
//  ContentView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        Header()
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink {
                            DetailView(pokemon: pokemon, pokemons: $viewModel.pokemons)
                        } label: {
                            PokemonCard(pokemon: pokemon)
                        }
                        .opacity(1)
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchPokemons()
            }
        }
    }
}

#Preview {
    ContentView()
}
