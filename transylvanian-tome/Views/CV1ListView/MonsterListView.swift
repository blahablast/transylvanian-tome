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
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                        Image("cv1Background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .ignoresSafeArea()
                        .overlay(Color.black.opacity(0.4))
                    VStack {
                        ScrollView() {
                            LazyVStack() {
                                ForEach(viewModel.monsters) { monster in
                                    MonsterListCell(monster: monster)
                                        .onTapGesture {
                                            viewModel.selectedMonster = monster // Set the selected monster in the viewModel
                                        }
                                }
                            }
                            .task {
                                viewModel.fetchMonsters()
                            }
                            // Removed the blur and manual detail view presentation
                        }
                        .padding()
                    }.onAppear(perform: viewModel.fetchMonsters)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Monsters")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .sheet(item: $viewModel.selectedMonster) { monster in
                CV1MonsterDetailView(monster: monster, selectedMonster: $viewModel.selectedMonster)
            }
        }
    }
}




struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView()
    }
}
