//
//  MensItemsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI

struct MensItemsView: View {
    @State private var showGridView: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: 0xF9F9F9).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Mens")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .padding()
                    
                    HStack{
                        Spacer()
                        Button(action: {}){
                            Image(systemName: "line.horizontal.3.decrease")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                        
                    Spacer()
                        
                        Menu{
                            Button(action: {}){
                                Text("Popular")
                            }
                            Button(action: {}){
                                Text("Newest")
                            }
                            Button(action: {}){
                                Text("Price: Low to High")
                            }
                            Button(action:{}){
                                Text("Price: High to Low")
                            }
                        }label: {Label("Sort By", systemImage: "arrow.up.arrow.down")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button(action: {
                            showGridView.toggle()
                        }){
                            Image(systemName: showGridView ? "square.grid.3x2.fill" : "rectangle.grid.1x2.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                    .background(Color(hex: 0xCCD1D1))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 10)
                    
                    getGridView()
                    
                }
            }
        }
    }
}

struct getGridView: View{
    var body: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
                ForEach(1...10, id: \.self) { index in
                    ClothsItemView(index: index)
                }
            }
            .padding()
        }
    }
}

struct ClothsItemView: View{
    let index: Int
    
    var body: some View{
        VStack(alignment:  .leading) {
            Image("nolimitDetails")
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
            
            HStack{
                ForEach(0..<5){ _ in
                    Image(systemName: "start.fill")
                        .foregroundColor(.yellow)
                }
            }
            Text("1890.00")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.top, 4)
            
            HStack(spacing: 10) {
                Button(action: {}){
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
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
        }
    }
}
    struct MensItemsView_Previews: PreviewProvider {
        static var previews: some View {
            MensItemsView()
        }
    }

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


