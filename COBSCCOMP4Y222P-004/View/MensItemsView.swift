//
//  MensItemsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI
import URLImage
import SDWebImageSwiftUI



    struct MensItemsView: View {
        @State private var showGridView: Bool = false
        @StateObject var productVM: MensViewModel = MensViewModel()
        @State private var navigate: Bool = false
        @State private var selectedProduct: Items?
        @State private var search: String = ""
        
        var body: some View {
            NavigationView{
                ZStack{
                    
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack{
                       
                        Text("TShirt")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .padding()
                        SearchAndScanView(search: $search)
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
                        BottomBar.BottomNavBarViewNew()
                        
                    }
                }
                .navigationBarItems(trailing:
                             NavigationLink(destination: ProfileView()) {
                                 Image(systemName: "person.fill")
                                     .foregroundColor(.black)
                             }
                         )
            }
        
        }
        
        
    }
    struct getGridView: View {
        var products: [Items]
        @State private var navigate: Bool = false
        @State private var selectedProduct: Items?
        
        var body: some View {
            VStack {
                ScrollView {
                    
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                        ForEach(products, id: \.id) { product in
                            ClothsItemView(product: product)
                            
                        }
                    }
                    .navigationTitle("Products")
                    .navigationBarTitleDisplayMode(.inline)
                    .background(
                        NavigationLink(
                            destination: DetailsView(selectedProduct: selectedProduct), // Fixing the argument here
                            isActive: $navigate,
                            label: { EmptyView() }
                        )
                    )
                }
            }
        }
        
        
        
        @ViewBuilder func ClothsItemView(product: Items) -> some View {
            // HStack{
            
            
            ZStack{
                
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    RoundedRectangle (cornerRadius: 10)
                        .frame(width:180, height:300)
                        .foregroundColor(.white)
                        .shadow(color : .black.opacity(0.5),radius:8)
                }
                VStack{
                    URLImage(URL(string: product.Image_url)!){image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(height: 150)}
                    
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
                        .shadow(color: Color.red.opacity(0.8), radius: 3, x: 0, y: 2)
                               
                                Button(action: {
                             
                                    navigate = true
                                }) {
                                    Image(systemName: "cart.fill")
                                        .foregroundColor(.blue)
                                        .padding()
                                }
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.blue.opacity(0.8), radius: 3, x: 0, y: 2)
                            }
                 
                        
                    }
                }
                .onTapGesture {
                    selectedProduct = product
                    navigate = true
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

