//
//  Character.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import Foundation

struct Character: Decodable {
    let name, status, species: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let created: String
}

// MARK: - Location
struct CharacterLocation: Decodable {
    let name: String
}

struct APIResult: Decodable {
    let results: [Character]
    let info: Info
}

struct Info: Decodable {
    let count: Int
    let pages: Int
}
