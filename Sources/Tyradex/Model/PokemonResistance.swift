//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonResistance: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String?
    public var multiplier: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case multiplier
    }
}
