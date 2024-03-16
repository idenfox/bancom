//
//  PokemonData.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

struct PokemonData: Codable {
    let species: Species
    let sprites: Sprite
    let types: [TypeData]
}

struct Species: Codable {
    let name: String
    let url: String
}

struct Sprite: Codable {
    let front_default: String?
}

struct TypeData: Codable {
    let slot: Int
    let type: TypeInfo
}

struct TypeInfo: Codable {
    let name: String
    let url: String
}
