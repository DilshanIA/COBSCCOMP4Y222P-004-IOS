//
//  MensItemsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI

struct MensItemsView: View {
    @State private var showGridView: Bool = false
    @StateObject var productVM: MensViewModel = MensViewModel()
    @State private var navigate: Bool = false
    @State private var selectedProduct: Items?
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: 0xF9F9F9).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                
//                        ForEach(productVM.Products, id: \.id) { product in
//                            ClothsItemView(product: product)
//                        
//                          }
                        
                        Text("TShirt")
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
                        getGridView(products: productVM.Products)
                        //getGridView()
                    BottomNavBarView1()
                    
                }
            }
        }
    }
}

struct getGridView: View{
    var products: [Items]
    var body: some View{
        HStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
                        ForEach(products, id: \.id) { product in
                            ClothsItemView(product: product)
                            
                        }
                    }
                    .padding()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(radius: 4)
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                }
            }
        }
    }
}

@ViewBuilder func ClothsItemView(product: Items) -> some View {
    HStack{
        VStack(alignment:  .leading) {
            Image("nolimitDetails")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
            
            
            Text(product.Product_Name)
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            Text("\(product.Price)")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.top, 4)
            
            
            HStack{
                ForEach(0..<5){ _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
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
                        .padding()
                }
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 0, y: 2)
            }
 
            
        }
        }
    }
struct BottomNavBarView1: View {
    var body: some View {
        HStack(spacing: 20) {
            BottomNavBarItem(image: Image(systemName: "house.fill"), label: "Home", action: {})
            BottomNavBarItem(image: Image(systemName: "heart.fill"), label: "Favorites", action: {})
            BottomNavBarItem(image: Image(systemName: "cart.fill"), label: "Shop", action: {})
            BottomNavBarItem(image: Image(systemName: "person.fill"), label: "Profile", action: {})
        }
        .padding(.horizontal
        )
        .background(Color.white)
       
        .padding()
        .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 6)
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


