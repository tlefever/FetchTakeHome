//
//  RecipeCardView.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            // Recipe Image
            if let photoURLSmall = recipe.photoURLSmall {
                AsyncImage(url: URL(string: photoURLSmall)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 80, height: 80)

                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
            } else {
                Image(systemName: "questionmark.square")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 80, height: 80)
            }

            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
    }
}

// Preview
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: Recipe(
            cuisine: "Italian",
            name: "Spaghetti Carbonara",
            photoURLLarge: "https://example.com/large.jpg",
            photoURLSmall: "https://example.com/small.jpg",
            uuid: "12345",
            sourceURL: nil,
            youtubeURL: nil
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
