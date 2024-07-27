//
//  NetworkConstant.swift
//  Essential
//
//  Created by KaayZenn on 09/03/2024.
//

import Foundation

struct NetworkPath {
    static let baseURL: String = "https://api-pokemon-fr.vercel.app/api/v1"
    
    struct Pokemon {
        static let pokemon: String = "/pokemon"
        static func specificPokemon(pokemonID: Int) -> String {
            return "/pokemon/\(pokemonID)"
        }
        static func regionOfPokemon(name: String, region: String) -> String {
            return "/pokemon/\(name)/\(region)"
        }
    }
    
    struct Generation {
        static func pokemonsOfGeneration(generation: String) -> String {
            return "/gen/\(generation)"
        }
    }
    
}
