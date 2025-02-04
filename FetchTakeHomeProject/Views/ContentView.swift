//
//  ContentView.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = RecipesViewModel()
    @State private var searchText = ""


    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { recipe in
                recipe.name.lowercased().contains(searchText.lowercased()) ||
                recipe.cuisine.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack {
                
                if viewModel.recipes.isEmpty {
                    ProgressView()
                } else {
                    
                    RecipeSearchBar(text: $searchText)

                    List(filteredRecipes, id: \ .uuid) { recipe in
                        NavigationLink(destination: {
                            RecipeDetailView(recipe: recipe)
                        }, label: {
                            RecipeCardView(recipe: recipe)
                            
                        })
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getRecipes()
            }
        }
        .refreshable {
            Task {
                await viewModel.getRecipes()
            }
        }
    }
}




#Preview {
    ContentView()
}
