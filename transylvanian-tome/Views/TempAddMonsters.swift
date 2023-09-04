//
//  TempAddMonsters.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/30/23.
//

import SwiftUI

struct TempAddMonsters: View {
    @ObservedObject var viewModel = CV1ViewModel()
    
    var body: some View {
        Button("Load and Populate Monsters") {
            viewModel.loadAndPopulateFirestore()
        }
    }
}

struct TempAddMonsters_Previews: PreviewProvider {
    static var previews: some View {
        TempAddMonsters()
    }
}
