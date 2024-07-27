//
//  Pokemon.swift
//
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct Pokemon: Codable, Identifiable {
    public var id: UUID = UUID()
    public var pokedexID: Int?
    public var generation: Int?
    public var category: String?
    public var name: PokemonName?
    public var sprites: PokemonSprite?
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
    
    init(pokedexID: Int? = nil, generation: Int? = nil, category: String? = nil, name: PokemonName? = nil, sprites: PokemonSprite? = nil, jsonTypes: [PokemonType]? = nil, jsonTalents: [PokemonTalent]? = nil, stats: PokemonStats? = nil, jsonResistances: [PokemonResistance]? = nil, evolution: PokemonEvolution? = nil, jsonHeight: String? = nil, jsonWeight: String? = nil, jsonEggGroups: [String]? = nil, sexe: PokemonSexe? = nil, jsonCatchRate: Int? = nil, jsonLevel100: Int? = nil, jsonForme: [PokemonForme]? = nil) {
        self.pokedexID = pokedexID
        self.generation = generation
        self.category = category
        self.name = name
        self.sprites = sprites
        self.jsonTypes = jsonTypes
        self.jsonTalents = jsonTalents
        self.stats = stats
        self.jsonResistances = jsonResistances
        self.evolution = evolution
        self.jsonHeight = jsonHeight
        self.jsonWeight = jsonWeight
        self.jsonEggGroups = jsonEggGroups
        self.sexe = sexe
        self.jsonCatchRate = jsonCatchRate
        self.jsonLevel100 = jsonLevel100
        self.jsonForme = jsonForme
    }
    
    enum CodingKeys: String, CodingKey {
        case pokedexID = "pokedex_id"
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
        if let name {
            if Locale.current.identifier.contains("fr") {
                return name.fr ?? ""
            } else if Locale.current.identifier.contains("jp") {
                return name.jp ?? ""
            } else {
                return name.en ?? ""
            }
        } else { return "" }
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

extension Pokemon {
    static public var preview: Pokemon {
        return .init(
            pokedexID: 6,
            generation: 1,
            category: "Pokémon Flamme",
            name: PokemonName(fr: "Dracaufeu", en: "Charizard", jp: "リザードン"),
            sprites: PokemonSprite(
                jsonRegular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/regular.png",
                jsonShiny: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/shiny.png",
                gmax: PokemonSpriteGMAX(
                    jsonRegular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/gmax-regular.png",
                    jsonShiny: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/gmax-shiny.png"
                )
            ),
            jsonTypes: [
                PokemonType(name: "Feu", image: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/feu.png"),
                PokemonType(name: "Vol", image: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/types/vol.png")
            ],
            jsonTalents: [
                PokemonTalent(name: "Brasier", tc: false),
                PokemonTalent(name: "Force Soleil", tc: true)
            ],
            stats: PokemonStats(hp: 78, atk: 84, def: 78, vit: 100, spe_atk: 109, spe_def: 85),
            jsonResistances: [
                PokemonResistance(name: "Normal", multiplier: 1),
                PokemonResistance(name: "Plante", multiplier: 0.25),
                PokemonResistance(name: "Feu", multiplier: 0.5),
                PokemonResistance(name: "Eau", multiplier: 2),
                PokemonResistance(name: "Électrik", multiplier: 2),
                PokemonResistance(name: "Glace", multiplier: 1),
                PokemonResistance(name: "Combat", multiplier: 0.5),
                PokemonResistance(name: "Poison", multiplier: 1),
                PokemonResistance(name: "Sol", multiplier: 0),
                PokemonResistance(name: "Vol", multiplier: 1),
                PokemonResistance(name: "Psy", multiplier: 1),
                PokemonResistance(name: "Insecte", multiplier: 0.25),
                PokemonResistance(name: "Roche", multiplier: 4),
                PokemonResistance(name: "Spectre", multiplier: 1),
                PokemonResistance(name: "Dragon", multiplier: 1),
                PokemonResistance(name: "Ténèbres", multiplier: 1),
                PokemonResistance(name: "Acier", multiplier: 0.5),
                PokemonResistance(name: "Fée", multiplier: 0.5)
            ],
            evolution: PokemonEvolution(
                pre: [
                    PokemonEvolutionDetailed(pokedexID: 4, name: "Salamèche"),
                    PokemonEvolutionDetailed(pokedexID: 5, name: "Reptincel")
                ],
                next: nil,
                mega: [
                    PokemonEvolutionMegaDetailed(
                        orbe: "Dracaufite X",
                        sprites: PokemonSprite(
                            jsonRegular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/mega_x-regular.png",
                            jsonShiny: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/mega_x-shiny.png"
                        )
                    ),
                    PokemonEvolutionMegaDetailed(
                        orbe: "Dracaufite Y",
                        sprites: PokemonSprite(
                            jsonRegular: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/mega_y-regular.png",
                            jsonShiny: "https://raw.githubusercontent.com/Yarkis01/TyraDex/images/sprites/6/mega_y-shiny.png"
                        )
                    )
                ]
            ),
            jsonHeight: "1,7 m",
            jsonWeight: "90,5 kg",
            jsonEggGroups: ["Draconique", "Monstrueux"],
            sexe: PokemonSexe(male: 87.5, female: 12.5),
            jsonCatchRate: 45,
            jsonLevel100: 1059862,
            jsonForme: nil
        )
    }
}
