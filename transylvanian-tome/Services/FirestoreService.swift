//
//  FirestoreService.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/29/23.
//

import Firebase

class FirestoreService {
    static let shared = FirestoreService()
    
    private init() {}
    
    
    
    // MARK: - LOADING MONSTERS TO FIRESTORE
    
    // this function fetches the monsters from a the local json file. Does NOT add them to firestore.
    func loadMonsters() -> [Monster] {
        if let url = Bundle.main.url(forResource: "CV1Monsters", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Monster].self, from: data)
                return jsonData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return []
    }
    
    func addMonstersToFirestore(monsters: [Monster]) {
        for monster in monsters {
            addMonsterToFirestore(monster: monster)
        }
    }
    
    func addMonsterToFirestore(monster: Monster) {
        let db = Firestore.firestore()
        
        // Check if a Monster with the same name already exists
        db.collection("CV1Monsters").whereField("name", isEqualTo: monster.name).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error checking Monster: \(error)")
                return
            }
            
            if let snapshot = snapshot, snapshot.documents.isEmpty {
                // No Monster with the same name found, so add the new Monster
                var ref: DocumentReference? = nil
                ref = db.collection("CV1Monsters").addDocument(data: [
                    "id": monster.id?.uuidString ?? UUID().uuidString,
                    "name": monster.name,
                    "description": monster.description,
                    "image": monster.image,
                    "location": monster.location
                    // Add other monster properties here
                ]) { err in
                    if let err = err {
                        print("Error adding CV1Monsters: \(err)")
                    } else {
                        print("CV1Monsters added with ID: \(ref!.documentID)")
                    }
                }
            } else {
                // A Monster with the same name exists, so skip
                print("CV1Monsters with the name \(monster.name) already exists!")
            }
        }
    }
}
