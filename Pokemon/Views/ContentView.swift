//
//  ContentView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        Header()
        
        NavigationStack {
            List(pokemons) { pokemon in
                ZStack {
                    NavigationLink(String()) {
                        DetailView(pokemon: pokemon, pokemons: $pokemons)
                    }
                    .opacity(0)
                    PokemonCard(pokemon: pokemon)
                }
                .listRowSeparator(.hidden)
                .swipeActions {
                    Button("Excluir") {
                        pokemons.removeAll {
                            $0.id == pokemon.id
                        }
                    }
                    
                    Button(role: .destructive, action: {
                        print("Remove Pokémon")
                    }) {
                        Label("Remove", systemImage: "trash")
                    }
                }
            }
            .listStyle(.plain)
            .onAppear() {
                guard pokemons.isEmpty else { return }
                Task {
                    do {
                        let pokemonsData = try await Network.shared.fetchPokemons()
                        pokemons = pokemonsData.enumerated().map { (index, data) in
                            Pokemon(data: data, cover: .init(indexImage: index + 1), typeColor: .init(apiType: "normal"))
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
