//
//  File.swift
//  
//
//  Created by KaayZenn on 27/07/2024.
//

import Foundation

public struct PokemonEvolution: Codable {
    public var pre: [PokemonEvolutionDetailed]?
    public var next: [PokemonEvolutionDetailed]?
    public var mega: [PokemonEvolutionMegaDetailed]?
}
