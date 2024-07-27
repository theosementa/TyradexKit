//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

 enum PokemonAPIRequester: APIRequestBuilder {
    case fetchPokemons
    case fetchPokemon(pokemonID: Int)
}

extension PokemonAPIRequester {
    public var path: String {
        switch self {
        case .fetchPokemons:                return NetworkPath.Pokemon.pokemon
        case .fetchPokemon(let pokemonID):  return NetworkPath.Pokemon.specificPokemon(pokemonID: pokemonID)
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
