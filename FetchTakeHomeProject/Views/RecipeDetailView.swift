//
//  RecipeDetailView.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let photoURLLarge = recipe.photoURLLarge {
                    AsyncImage(url: URL(string: photoURLLarge)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .frame(height: 300)
                    }
                    
                } else {
                    Image(systemName: "questionmark.square")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                }
                

                // Recipe Name
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                
                // Cuisine
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                // Links Section
                VStack(alignment: .leading, spacing: 12) {
                    if let sourceURL = recipe.sourceURL {
                        Divider()

                        HStack{
                            
                            Link("Recipe Source", destination: URL(string: sourceURL)!)
                               
                            Spacer()
                            
                            ShareLink(item: sourceURL) {
                                Label("Share Source", systemImage: "square.and.arrow.up")
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        

                    }
                    
                    
                    if let youtubeURL = recipe.youtubeURL {
                        Divider()

                        HStack{
                            Link("Watch on YouTube", destination: URL(string: youtubeURL)!)
                                
                            Spacer()
                            
                            ShareLink(item: youtubeURL) {
                                Label("Share YouTube Link", systemImage: "square.and.arrow.up")
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.top)
        }
    }
}
