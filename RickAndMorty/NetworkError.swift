//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(String)
    case decodingFailed(String)
    case unknown(String)
}
