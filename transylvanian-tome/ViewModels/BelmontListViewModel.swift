//
//  BelmontListView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//


import SwiftUI

class BelmontListViewModel: ObservableObject {
    @Published var belmonts: [Belmonts] = [
        Belmonts(id: "1", name: "Alucard", description: "The son of Dracula"),
        Belmonts(id: "2", name: "Simon Belmont", description: "A renowned vampire hunter")
    ]
    
    
}
