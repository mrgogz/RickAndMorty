//
//  Character.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import Foundation

struct Character: Codable, Equatable {
    let name, status, species: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let created: String
}

// MARK: - Location
struct CharacterLocation: Codable, Equatable{
    let name: String
}

struct APIResult: Codable, Equatable {
    let results: [Character]
    let info: Info
}

struct Info: Codable, Equatable {
    let count: Int
    let pages: Int
}
