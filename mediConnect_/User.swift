//
//  User.swift
//  mediConnect_
//
//  Created by Rita Sabri on 4/4/23.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: Int
    let name: String
    let profileImage: String
    let sharedMedicine : Int
}

let sampleMatches: [User] = [
    User(id: 1, name: "Alice", profileImage: "alice", sharedMedicine: 1),
    User(id: 2, name: "Bob", profileImage: "bob", sharedMedicine: 3),
    User(id: 3, name: "Charlie", profileImage: "charlie", sharedMedicine: 3)
]
