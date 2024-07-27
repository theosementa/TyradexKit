//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public class PokemonRepository: ObservableObject {
    public static let shared = PokemonRepository()
    
    @Published public var pokemons: [Pokemon] = []
}

extension PokemonRepository {
    
    @MainActor
    public func fetchPokemons() async {
        do {
            let pokemons = try await NetworkService.shared.sendRequest(
                apiBuilder: PokemonAPIRequester.fetchPokemons,
                responseModel: [Pokemon].self
            )
            
            self.pokemons = pokemons.sorted { $0.pokedexID ?? 0 < $1.pokedexID ?? 0 }
            self.pokemons.removeFirst()
        } catch let error {
            if let networkError = error as? NetworkError {
                print("⚠️ \(networkError)")
            }
        }
    }
    
    @MainActor
    public func getPokemon(pokemonID: Int) async -> Pokemon? {
        if let pokemon = self.pokemons.first(where: { $0.pokedexID == pokemonID }) {
            return pokemon
        } else {
            do {
                let pokemon = try await NetworkService.shared.sendRequest(
                    apiBuilder: PokemonAPIRequester.getPokemon(pokemonID: pokemonID),
                    responseModel: Pokemon.self
                )
                return pokemon
            } catch let error {
                if let networkError = error as? NetworkError {
                    print("⚠️ \(networkError)")
                }
                return nil
            }
        }
    }
    
    @MainActor
    public func getPokemonsOfGeneration(generation: String) async -> [Pokemon] {
        do {
            let pokemons = try await NetworkService.shared.sendRequest(
                apiBuilder: PokemonAPIRequester.pokemonsOfGeneration(generation: generation),
                responseModel: [Pokemon].self
            )
            return pokemons
        } catch let error {
            if let networkError = error as? NetworkError {
                print("⚠️ \(networkError)")
            }
            return []
        }
    }
    
    @MainActor
    public func getRegionalFormOfPokemon(name: String, region: String) async -> Pokemon? {
        do {
            let pokemon = try await NetworkService.shared.sendRequest(
                apiBuilder: PokemonAPIRequester.regionOfPokemon(name: name, region: region),
                responseModel: Pokemon.self
            )
            return pokemon
        } catch let error {
            if let networkError = error as? NetworkError {
                print("⚠️ \(networkError)")
            }
            return nil
        }
    }
    
}
