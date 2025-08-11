//
//  Friends.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 6.08.25.
//

import Foundation

struct Friends: Identifiable {
    var id: String
    var name: String
}

extension Friends: Codable {
    private enum CodingKeys: CodingKey {
        case id
        case name
    }
}
