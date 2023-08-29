//
//  TempAddBelmont.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/29/23.
//

import SwiftUI

struct TempAddBelmont: View {
    var body: some View {
        Button("Populate Firestore") {
            populateFirestore()
        }
    }
    
    func populateFirestore() {
        let viewModel = BelmontListViewModel()
        
        for belmont in viewModel.belmonts {
            let imageString = belmont.image?.absoluteString ?? ""
            FirestoreService.shared.addBelmontToFirestore(name: belmont.name, description: belmont.description, image: imageString, strength: belmont.strength, weakness: belmont.weakness)
        }
    }
}

struct TempAddBelmont_Previews: PreviewProvider {
    static var previews: some View {
        TempAddBelmont()
    }
}
