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
    }
    
}
