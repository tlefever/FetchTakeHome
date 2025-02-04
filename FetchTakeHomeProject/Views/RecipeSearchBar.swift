//
//  RecipeSearchBar.swift
//  fetchtakehome
//
//  Created by Tyson Lefever on 2/4/25.
//

import SwiftUI

struct RecipeSearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search recipes", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
        }
        .padding(.top, 10)
    }
}
