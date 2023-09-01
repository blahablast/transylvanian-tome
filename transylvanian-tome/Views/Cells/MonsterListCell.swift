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
        HStack(alignment: .center) {
            // Display the image from the URL
            if let imageUrl = URL(string: monster.image) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
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
                .padding()
            }
            
            // Display the name and description
            VStack(alignment: .leading, spacing: 2) {
                Text(monster.name)
                    .font(.headline)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .foregroundColor(Color.white)
                Text(monster.description)
                    .font(.subheadline)
                    .truncationMode(.tail)
                    .lineLimit(2)
                    .foregroundColor(Color.white)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.4))
        .border(Color.gray, width: 2)
        .cornerRadius(5)
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
