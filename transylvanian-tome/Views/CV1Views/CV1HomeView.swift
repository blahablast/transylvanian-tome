//
//  CV1HomeView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 9/2/23.
//

import SwiftUI

struct CV1HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: MonsterListView()) {
                    Text("Monsters")
                    
                }

            }
        }
        
    }
}

struct CV1HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CV1HomeView()
    }
}
