//
//  MonsterListViewModel.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/30/23.
//

import SwiftUI

class MonsterListViewModel: ObservableObject {
    @Published var monsters: [Monster] = []
    
    func loadAndPopulateFirestore() {
        self.monsters = FirestoreService.shared.loadMonsters()
        FirestoreService.shared.addMonstersToFirestore(monsters: self.monsters)
    }
}
