//
//  Model.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 7.08.25.
//

import Foundation

@MainActor
class Model: ObservableObject {
    @Published var user = [User]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUsers = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    self.user = decodedUsers
                }
            } catch {
                print("Decoding Error: \(error)")
            }
        }
        .resume()
    }
}
