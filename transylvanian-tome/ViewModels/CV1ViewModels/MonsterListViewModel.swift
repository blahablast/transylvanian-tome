//
//  MonsterListViewModel.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/30/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class MonsterListViewModel: ObservableObject {
    @Published var monsters: [Monster] = []
    
    func loadAndPopulateFirestore() {
        self.monsters = FirestoreService.shared.loadMonsters()
        FirestoreService.shared.addMonstersToFirestore(monsters: self.monsters)
    }
    
    func fetchMonsters() {
        Firestore.firestore().collection("CV1Monsters").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting monsters: \(error)")
                return
            }
            
            self.monsters = snapshot?.documents.compactMap { document in
                try? document.data(as: Monster.self, decoder: Firestore.Decoder())
            } ?? []
        }
    }

}
