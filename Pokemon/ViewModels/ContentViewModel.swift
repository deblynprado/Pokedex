//
//  ContentViewModel.swift
//  Pokemon
//
//  Created by Deblyn Prado on 24/06/25.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemons() async {
        guard pokemons.isEmpty else { return }
        
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
