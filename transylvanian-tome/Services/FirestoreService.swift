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
    
    func addBelmontToFirestore(name: String, description: String, image: String, strength: Int, weakness: String) {
        let db = Firestore.firestore()
        
        // Check if a Belmont with the same name already exists
        db.collection("belmonts").whereField("name", isEqualTo: name).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error checking Belmont: \(error)")
                return
            }
            
            if let snapshot = snapshot, snapshot.documents.isEmpty {
                // No Belmont with the same name found, so add the new Belmont
                var ref: DocumentReference? = nil
                ref = db.collection("belmonts").addDocument(data: [
                    "name": name,
                    "description": description,
                    "image": image,
                    "strength": strength,
                    "weakness": weakness
                ]) { err in
                    if let err = err {
                        print("Error adding Belmont: \(err)")
                    } else {
                        print("Belmont added with ID: \(ref!.documentID)")
                    }
                }
            } else {
                // A Belmont with the same name exists, so skip
                print("Belmont with the name \(name) already exists!")
            }
        }
    }
}
