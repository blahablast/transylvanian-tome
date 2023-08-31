//
//  MonsterListView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/31/23.
//

import SwiftUI

struct MonsterListView: View {
    @ObservedObject var viewModel = MonsterListViewModel()
    
    
    var body: some View {
        List(viewModel.monsters) { monster in
            MonsterListCell(monster: monster)
        }
        .onAppear(perform: viewModel.fetchMonsters)
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView()
    }
}
