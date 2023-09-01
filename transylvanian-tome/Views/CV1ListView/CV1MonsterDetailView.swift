//
//  CV1MonsterDetailView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 9/1/23.
//

import SwiftUI

struct CV1MonsterDetailView: View {
    let monster: Monster
    @Binding var selectedMonster: Monster?  // This binding now points to the optional Monster
    
    var body: some View {
        ZStack {
            Image("cv1Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.4))
            
            VStack {
                if let imageUrl = URL(string: monster.image) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 3)
                        case .failure:
                            Image(systemName: "photo")
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .clipShape(Circle())
                        case .empty:
                            Image(systemName: "photo.fill")
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .clipShape(Circle())
                        @unknown default:
                            Image(systemName: "photo.fill")
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .clipShape(Circle())
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                }
                
                VStack {
                    Text(monster.name)
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.bottom, 20)
                    
                    Text(monster.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding(.bottom, 30)
                    
                    HStack {
                        MonsterInfo(title: "HP ❤️", value: monster.location)
                        MonsterInfo(title: "EXP 📈", value: monster.location)
                        MonsterInfo(title: "Attack ⚔️", value: monster.location)
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        MonsterInfo(title: "Location 📍", value: monster.location)
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                selectedMonster = nil  // This is the change to dismiss the detail view
            } label: {
                XDismissBtn()
            }, alignment: .topTrailing)
        }
    }
}


struct CV1MonsterDetailView_Previews: PreviewProvider {
    
    @State static var selectedMonster: Monster? = Monster(id: UUID(), name: "Dracula", description: "The main antagonist", image: "https://static.wikia.nocookie.net/castlevania/images/5/51/DracSymph.jpg/revision/latest/scale-to-width-down/1000?cb=20200703143712", location: "Various")
    
    static var previews: some View {
        CV1MonsterDetailView(monster: selectedMonster!, selectedMonster: $selectedMonster)
    }
}


struct MonsterInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
         
        }
    }
    
}
