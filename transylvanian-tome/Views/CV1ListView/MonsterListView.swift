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
        GeometryReader { geometry in
            ZStack {
                Image("cv1Background")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.6))
                    .frame(width: geometry.size.width)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.monsters) { monster in
                            MonsterListCell(monster: monster)
                        }
                    }
                    .padding()
                    .padding(EdgeInsets(
                        top: geometry.safeAreaInsets.top,
                        leading: geometry.safeAreaInsets.leading,
                        bottom: geometry.safeAreaInsets.bottom,
                        trailing: geometry.safeAreaInsets.trailing
                    ))
                }
                .background(Color.clear)
            }
        }
        .onAppear(perform: viewModel.fetchMonsters)
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView()
    }
}
