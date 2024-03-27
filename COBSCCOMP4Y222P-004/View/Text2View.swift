//
//  Text2View.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI

struct Text2View: View {
    @State private var showGridView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xF9F9F9).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("My Favorites")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "line.horizontal.3.decrease")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Menu {
                            Button(action: {}) {
                                Text("Popular")
                            }
                            Button(action: {}) {
                                Text("Newest")
                            }
                            Button(action: {}) {
                                Text("Price: Low to High")
                            }
                            Button(action: {}) {
                                Text("Price: High to Low")
                            }
                        } label: {
                            Label("Sort By", systemImage: "arrow.up.arrow.down")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGridView.toggle()
                        }) {
                            Image(systemName: showGridView ? "square.grid.3x2.fill" : "rectangle.grid.1x2.fill")
                                .resizable()
                                .frame(width: 30, height: 20)
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                    .background(Color(hex: 0xCCD1D1))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 10)
                    
                    
                        ExtractedGridView()
               
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ExtractedGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(1...10, id: \.self) { index in
                    ClothingItemView(index: index)
                }
            }
            .padding()
        }
    }
}

struct ExtractedListView: View {
    var body: some View {
        List(1...10, id: \.self) { index in
            ClothingItemView(index: index)
        }
        .padding()
    }
}

struct ClothingItemView: View {
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("placeholder_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(10)
            
            Text("Product \(index)")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 8)
            
            Text("Brand Name")
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
            }
            
            Text("$100")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.top, 4)
            
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
                
                Button(action: {}) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
            }
            .padding(.top, 8)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
    }
}

struct MenItemView_Previews: PreviewProvider {
    static var previews: some View {
        Text2View()
    }
}

// Helper Extension for Color
extension Color {
    init(hex: Int) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1.0
        )
    }
}
