//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonEvolutionDetailed: Codable, Identifiable {
    public var id: UUID = UUID()
    public var pokedexID: Int?
    public var name: String?
    
    init(pokedexID: Int? = nil, name: String? = nil) {
        self.pokedexID = pokedexID
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedex_id"
        case name
    }
}
