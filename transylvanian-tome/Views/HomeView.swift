//
//  ContentView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MonsterListView()) {
                    Text("View Monsters")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
