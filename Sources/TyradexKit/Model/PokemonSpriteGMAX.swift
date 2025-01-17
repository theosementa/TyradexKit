//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonSpriteGMAX: Codable {
    private var jsonRegular: String?
    private var jsonShiny: String?
    
    init(jsonRegular: String? = nil, jsonShiny: String? = nil) {
        self.jsonRegular = jsonRegular
        self.jsonShiny = jsonShiny
    }
    
    enum CodingKeys: String, CodingKey {
        case jsonRegular = "regular"
        case jsonShiny = "shiny"
    }
    
    // Unwrapped
    public var regular: String {
        if let jsonRegular { return jsonRegular } else { return "" }
    }
    public var shiny: String {
        if let jsonShiny { return jsonShiny } else { return "" }
    }
}
