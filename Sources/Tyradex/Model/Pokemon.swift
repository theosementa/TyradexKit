//
//  Pokemon.swift
//
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct Pokemon: Codable, Identifiable {
    public var id: UUID = UUID()
    public var pokedexID: Int
    public var generation: Int
    public var category: String
    public var name: PokemonName
    public var sprites: PokemonSprite
    private var jsonTypes: [PokemonType]?
    private var jsonTalents: [PokemonTalent]?
    public var stats: PokemonStats?
    private var jsonResistances: [PokemonResistance]?
    public var evolution: PokemonEvolution?
    private var jsonHeight: String?
    private var jsonWeight: String?
    private var jsonEggGroups: [String]?
    public var sexe: PokemonSexe?
    private var jsonCatchRate: Int?
    private var jsonLevel100: Int?
    private var jsonForme: [PokemonForme]?
    
    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedexId"
        case generation
        case category
        case name
        case sprites
        case jsonTypes = "types"
        case jsonTalents = "talents"
        case stats
        case jsonResistances = "resistances"
        case evolution
        case jsonHeight = "height"
        case jsonWeight = "weight"
        case jsonEggGroups = "egg_groups"
        case sexe
        case jsonCatchRate = "catch_rate"
        case jsonLevel100 = "level_100"
        case jsonForme = "forme"
    }
    
    // Unwrapped
    public var nameLocalized: String {
        if Locale.current.identifier.contains("fr") {
            return name.fr
        } else if Locale.current.identifier.contains("jp") {
            return name.jp
        } else {
            return name.en
        }
    }
    public var types: [PokemonType] {
        if let jsonTypes { return jsonTypes } else { return [] }
    }
    public var talents: [PokemonTalent] {
        if let jsonTalents { return jsonTalents } else { return [] }
    }
    public var resistances: [PokemonResistance] {
        if let jsonResistances { return jsonResistances } else { return [] }
    }
    
    public var height: Double {
        if let jsonHeight {
            let value = jsonHeight.replacingOccurrences(of: " m", with: "").replacingOccurrences(of: ",", with: ".")
            return Double(value) ?? 0.0
        } else { return 0.0 }
    }
    public var weight: Double {
        if let jsonWeight {
            let value = jsonWeight.replacingOccurrences(of: " kg", with: "").replacingOccurrences(of: ",", with: ".")
            return Double(value) ?? 0.0
        } else { return 0.0 }
    }
    public var eggGroups: [String] {
        if let jsonEggGroups { return jsonEggGroups } else { return [] }
    }
    public var catchRate: Int {
        if let jsonCatchRate { return jsonCatchRate } else { return 0 }
    }
    public var level100: Int {
        if let jsonLevel100 { return jsonLevel100 } else { return 0 }
    }
    public var forme: [PokemonForme] {
        if let jsonForme { return jsonForme } else { return [] }
    }
}
