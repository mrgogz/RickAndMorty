//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://rickandmortyapi.com/api"
    
    func getCharacters(page: Int) async throws -> [Character] {
        let endpoint = baseURL + "/character/?page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed("Request failed with status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
            }
            
            // Decode the data into the Character model
            let APIResult = try JSONDecoder().decode(APIResult.self, from: data)
            return APIResult.results
            
        } catch let decodingError as DecodingError {
            throw NetworkError.decodingFailed("Decoding error: \(decodingError.localizedDescription)")
        } catch {
            throw NetworkError.unknown("An unknown error occurred: \(error.localizedDescription)")
        }
        
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            return image
        } catch {
            return nil
        }
    }
    
}
