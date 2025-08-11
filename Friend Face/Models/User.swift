//
//  User.swift
//  Friend Face
//
//  Created by Nikolay Simeonov on 6.08.25.
//

import Foundation

struct User: Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var friends: [Friends]
}

extension User: Codable {
    private enum CodingKeys: CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case friends
    }
}
