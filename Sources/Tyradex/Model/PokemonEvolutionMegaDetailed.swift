//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonEvolutionMegaDetailed: Codable, Identifiable {
    public var id: UUID = UUID()
    public var orbe: String?
    public var sprites: PokemonSprite?
    
    enum CodingKeys: String, CodingKey {
        case orbe
        case sprites
    }
}
