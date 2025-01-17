//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonType: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String?
    public var image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
    }
}
