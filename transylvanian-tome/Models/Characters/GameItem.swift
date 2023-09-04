//
//  Monsters.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import Foundation

struct GameItem: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var description: String
    var image: String
    var location: String?
    var itemUsage: String?
}
