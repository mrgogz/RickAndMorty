//
//  PersistentManager.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 22.08.2024.
//

import Foundation

struct PersistentManager {
    
    static let shared = PersistentManager()
    func saveData(data: [Character]) {
        do {
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.setValue(data, forKey: "data")
        }
        catch{
            print("Error encoding data: \(error)")
        }
    }
    
    func readData() -> [Character] {
        do{
            if let savedData = UserDefaults.standard.data(forKey: "data") {
                return try JSONDecoder().decode([Character].self, from: savedData)
            }
        }
        catch{
            print("Error decoding data: \(error)")
            return []
        }
        return []
    }
}
