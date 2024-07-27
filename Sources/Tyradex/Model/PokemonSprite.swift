//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonSprite: Codable {
    private var jsonRegular: String?
    private var jsonShiny: String?
    public var gmax: PokemonSpriteGMAX?
    
    enum CodingKeys: String, CodingKey {
        case jsonRegular = "regular"
        case jsonShiny = "shiny"
        case gmax
    }
    
    // Unwrapped
    public var regular: String {
        if let jsonRegular { 
            return jsonRegular
        } else { return "" }
    }
    
    public var shiny: String {
        if let jsonShiny { 
            return jsonShiny
        } else { return "" }
    }
}
