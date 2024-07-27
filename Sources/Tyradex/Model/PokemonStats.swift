//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonStats: Codable {
    public var hp: Int
    public var atk: Int
    public var def: Int
    public var vit: Int
    public var spe_atk: Int
    public var spe_def: Int
    
    enum CodingKeys: String, CodingKey {
        case hp
        case atk
        case def
        case vit
        case spe_atk
        case spe_def
    }
    
    // Computed var
    public var total: Int {
        return (hp + atk + def + vit + spe_atk + spe_def)
    }
}
