//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonForme: Codable, Identifiable {
    public var id: UUID = UUID()
    private var json_alola: String?
    private var json_hisui: String?
    private var json_galar: String?
    
    enum CodingKeys: String, CodingKey {
        case json_alola = "alola"
        case json_hisui = "hisui"
        case json_galar = "galar"
    }
    
    // Unwrapped
    public var alola: String {
        if let json_alola { return json_alola } else { return "" }
    }
    public var hisui: String {
        if let json_hisui { return json_hisui } else { return "" }
    }
    public var galar: String {
        if let json_galar { return json_galar } else { return "" }
    }
}
