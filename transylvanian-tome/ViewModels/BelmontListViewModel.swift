//
//  BelmontListView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//


import SwiftUI

class BelmontListViewModel: ObservableObject {
    @Published var belmonts: [Belmonts] = [
        Belmonts(id: "1", name: "Simon Belmont", description: "A renowned vampire hunter", strength: 10, weakness: "Low Agility"),
        Belmonts(id: "2", name: "Richter Belmont", description: "Famous for helping Alucard", strength: 9, weakness: "Easily possessed")
    ]
}
