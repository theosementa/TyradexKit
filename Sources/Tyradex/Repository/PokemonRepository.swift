//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public class PokemonRepository: ObservableObject {
    public static let shared = PokemonRepository()
    
    @Published var pokemons: [Pokemon] = []
}

extension PokemonRepository {
    
    @MainActor
    func fetchPokemons() async {
        do {
            let pokemons = try await NetworkService.shared.sendRequest(
                apiBuilder: PokemonAPIRequester.fetchPokemons,
                responseModel: [Pokemon].self
            )
            
            self.pokemons = pokemons.sorted { $0.pokedexID < $1.pokedexID }
        } catch let error {
            if let networkError = error as? NetworkError {
                print("⚠️ \(networkError)")
            }
        }
    }
    
}
