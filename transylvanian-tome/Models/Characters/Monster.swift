//
//  Monsters.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import Foundation

struct Monster: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var description: String
    var image: String
    var strength: Int
    var weakness: String
}
