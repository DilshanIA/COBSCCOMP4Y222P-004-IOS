//
//  Home.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-13.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    private let categories = ["All", "Men's", "Women's", "Kids'", "Shoes", "Accessories"]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5215686275, green: 0.7529411765, blue: 0.937254902, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                

                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        OfferPhotosView()
                        .padding(.bottom)
                        
                        
                        Text("Popular Brand")
                            .font(.custom("PlayfairDisplay-Bold", size: 20))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: Details(),
                                        label: {
                                            ProductCardView(image: Image("nike"), brandName: "NIKE", size: 110)
                                            ProductCardView(image: Image("moose"), brandName: "MOOSE", size: 110)
                                            ProductCardView(image: Image("cocodile"), brandName: "COCODILE", size: 110)
                                            ProductCardView(image: Image("boss"), brandName: "BOSS", size: 110)
                                            ProductCardView(image: Image("odel"), brandName: "ODEL", size: 110)

                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 20))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("mandara"), brandName: "MANDARA", size: 110)
                                    ProductCardView(image: Image("nihal"), brandName: "NIHAL", size: 110)
                                    ProductCardView(image: Image("nolimit"), brandName: "NOLIMIT", size: 110)
                                    ProductCardView(image: Image("fationbug"), brandName: "FA_BUG", size: 110)
                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
             }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct TagLineView: View {
    var body: some View {
        Text("Welcome To ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.white)
            + Text("Dilshan!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
    }
}

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
                    .background(Color.blue)
                    .cornerRadius(8)
            }

        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .white : .black)
                .padding(8)
                .background(isActive ? Color("Primary") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.trailing)
    }
}

struct OfferPhotosView: View {
    let offerImages = ["offer1", "offer2", "offer3"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(offerImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200) // Adjust size as needed
                }
                
                ForEach(offerImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200) // Adjust size as needed
                }
            }
        }
    }
}
struct ProductCardView: View {
    let image: Image
    let brandName: String
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 100 * (size/75))
                .cornerRadius(10.0)
            Text(brandName)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    Image("star")
                }
                Spacer()
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}


struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image(systemName: "house.fill"), label: "Home", action: {})
            BottomNavBarItem(image: Image(systemName: "heart.fill"), label: "Favorites", action: {})
            BottomNavBarItem(image: Image(systemName: "cart.fill"), label: "Shop", action: {})
            BottomNavBarItem(image: Image(systemName: "person.fill"), label: "Profile", action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.15), radius: 2, x: 2, y: 6)
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
                .frame(width: 24, height: 24)
            Text(label)
                .font(.caption)
        }
        .padding(.vertical, 2)
        .foregroundColor(Color.primary)
        .onTapGesture(perform: action)
    }
    
    
    
    
    struct BackButton: View {
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .padding(.all, 12)
                    .background(Color.white)
                    .cornerRadius(8.0)
            }
        }
    }
}
