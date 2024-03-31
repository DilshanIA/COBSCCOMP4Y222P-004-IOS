//
//  BottomBar.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import Foundation
import SwiftUI

struct BottomBar  {
    struct BottomNavBarViewNew: View {
        var body: some View {
            HStack(spacing: 40) { // Add spacing between items
                BottomNavBarItem(image: Image(systemName: "house.fill"), label: "Home", action: {})
                BottomNavBarItem(image: Image(systemName: "heart.fill"), label: "Favorites", action: {})
                BottomNavBarItem(image: Image(systemName: "cart.fill"), label: "Shop", action: {})
                BottomNavBarItem(image: Image(systemName: "person.fill"), label: "Profile", action: {})
            }
            .padding()
            .background(Color.white)
            
            
            
        }
    }
    
    struct BottomNavBarItem: View {
        let image: Image
        let label: String
        let action: () -> Void
        
        var body: some View {
            VStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 20)
                Text(label)
                    .font(.caption)
            }
            .padding(.vertical, 2)
            .foregroundColor(Color.primary)
            .onTapGesture(perform: action)
            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 2, y: 6)
        }
    }}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                    .fixedSize()
                    .padding(.trailing, 10)
                TextField("Search for products", text: $search)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            Button(action: {
               
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(8)
            }

        }
        .padding(.horizontal)
    }
}

