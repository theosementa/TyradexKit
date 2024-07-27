//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonEvolutionDetailed: Codable, Identifiable {
    public var id: UUID = UUID()
    public var pokedexID: Int
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedexId"
        case name
    }
}
