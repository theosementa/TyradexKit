//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

enum PokemonAPIRequester: APIRequestBuilder {
    case fetchPokemons
    case getPokemon(pokemonID: Int)
    case regionOfPokemon(name: String, region: String)
    case pokemonsOfGeneration(generation: String)
}

extension PokemonAPIRequester {
    public var path: String {
        switch self {
        case .fetchPokemons:                return NetworkPath.Pokemon.pokemon
        case .getPokemon(let pokemonID):    return NetworkPath.Pokemon.specificPokemon(pokemonID: pokemonID)
        case .regionOfPokemon(let name, let region): return NetworkPath.Pokemon.regionOfPokemon(name: name, region: region)
        case .pokemonsOfGeneration(let generation):  return NetworkPath.Generation.pokemonsOfGeneration(generation: generation)
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .GET
    }
    
    public var parameters: [URLQueryItem]? {
        return nil
    }
    
    
    public var body: Data? {
        return nil
    }
}
