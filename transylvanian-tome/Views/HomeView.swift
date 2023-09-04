//
//  ContentView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: CV1HomeView()) {
                    Text("Castlevania")
                        .font(Font.custom("FetteUnzfraktur", size: 30))
                }
            }
            .navigationTitle("Transylvanian Tome")
            
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
