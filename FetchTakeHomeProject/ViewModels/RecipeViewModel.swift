//
//  RecipeViewModel.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//
import SwiftUI



class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func getRecipes() async {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            return
        }
        
        do {
            print("Sending GET request to fetch recipes")
            let (recipeData, response) = try await URLSession.shared.data(from: url)
            
            // can use response status code to check for success, won't be implementing since the URL was given to me
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
            }
            
            
            do {
                let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: recipeData)
                DispatchQueue.main.async {
                    print("Decoded successfully!")
                    self.recipes = decodedResponse.recipes
                }
            } catch {
                print("JSON Decoding Error: \(error)")
            }
            
        } catch {
            print("Error fetching recipes: \(error.localizedDescription)")
        }
    }
}
