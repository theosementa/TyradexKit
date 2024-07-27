//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonTalent: Codable, Identifiable {
    public var id: UUID = UUID()
    public var name: String?
    public var tc: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name
        case tc
    }
}
