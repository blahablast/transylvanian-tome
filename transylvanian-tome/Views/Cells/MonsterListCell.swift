//
//  MonsterListCell.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/31/23.
//

import SwiftUI

struct MonsterListCell: View {
    var monster: Monster
    
    var body: some View {
        HStack {
            // Display the image from the URL
            if let imageUrl = URL(string: monster.image) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)  // Adjust this to your preferred size
                            .clipShape(Circle())           // Makes it round, remove if not wanted
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // Optional white border
                            .shadow(radius: 3)              // Optional shadow
                    case .failure:
                        Image(systemName: "photo") // Placeholder for failed image
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .clipShape(Circle())
                    case .empty:
                        Image(systemName: "photo.fill") // Placeholder for empty state
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .clipShape(Circle())
                    @unknown default:
                        Image(systemName: "photo.fill") // Placeholder for any other unknown state
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                }
                .padding(.trailing, 10)
            }
            
            // Display the name and description
            VStack(alignment: .leading) {
                Text(monster.name)
                    .font(.headline)
                Text(monster.description)
                    .font(.subheadline)
            }
        }
    }
}



struct MonsterListCell_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample monster
        let sampleMonster = Monster(id: UUID(), name: "Dracula", description: "The main antagonist", image: "https://static.wikia.nocookie.net/castlevania/images/5/51/DracSymph.jpg/revision/latest/scale-to-width-down/1000?cb=20200703143712", location: "Various")

        // Use the sample monster for the preview
        MonsterListCell(monster: sampleMonster)
    }
}
