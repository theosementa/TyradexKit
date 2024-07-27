//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonStats: Codable {
    public var hp: Int?
    public var atk: Int?
    public var def: Int?
    public var vit: Int?
    public var spe_atk: Int?
    public var spe_def: Int?
    
    init(hp: Int? = nil, atk: Int? = nil, def: Int? = nil, vit: Int? = nil, spe_atk: Int? = nil, spe_def: Int? = nil) {
        self.hp = hp
        self.atk = atk
        self.def = def
        self.vit = vit
        self.spe_atk = spe_atk
        self.spe_def = spe_def
    }
    
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
        var total: Int = 0
        if let hp { total += hp }
        if let atk { total += atk }
        if let def { total += def }
        if let vit { total += vit }
        if let spe_atk { total += spe_atk }
        if let spe_def { total += spe_def }
        return total
    }
}
