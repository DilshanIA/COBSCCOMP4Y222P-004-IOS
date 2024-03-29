//
//  Test.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-29.
//

import SwiftUI

struct Test: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1568627451, green: 0.4, blue: 0.662745098, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        TagLine1View()
                            .padding()
                        
                       // SearchAndScanView1(search: $search)
                        
                    
                        
                        OfferPhotosView()
                        .padding(.bottom)
                        
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1568627451, green: 0.4, blue: 0.662745098, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        Text("Casual Wear")
                            .font(.custom("PlayfairDisplay-Bold", size: 20))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: DetailsView(),
                                        label: {
                                            ProductCardView(image: Image("nolimitDetails"), brandName: "T-Shirt", size: 110)
                                            ProductCardView(image: Image("Shirt"), brandName: "Shirts", size: 110)
                                            ProductCardView(image: Image("Thouser"), brandName: "Trouser", size: 110)
                                            ProductCardView(image: Image("jeans"), brandName: "Jeans", size: 110)
                                            ProductCardView(image: Image("shorts"), brandName: "Shorts", size: 110)

                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1568627451, green: 0.4, blue: 0.662745098, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        Text("Formal Wear")
                            .font(.custom("PlayfairDisplay-Bold", size: 20))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("F-Shirt"), brandName: "Shirt", size: 110)
                                    ProductCardView(image: Image("F-Touser"), brandName: "Trouser", size: 110)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1568627451, green: 0.4, blue: 0.662745098, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        Text("Accessories")
                            .font(.custom("PlayfairDisplay-Bold", size: 20))
                            .padding(.horizontal)
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("Belt"), brandName: "Belts", size: 110)
                                    ProductCardView(image: Image("Watches"), brandName: "Watches", size: 110)
                                    ProductCardView(image: Image("Caps"), brandName: "Caps", size: 110)
                                    ProductCardView(image: Image("Wallert"), brandName: "Wallerts", size: 110)
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


   struct MensView_Previews: PreviewProvider {
       static var previews: some View {
           Test()
       }
   }
struct TagLine1View: View {
    var body: some View {
        Text("Men's ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.white)
        + Text("Cloths!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
    }
    
    
    
    struct SearchAndScanView1: View {
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
                    .foregroundColor(isActive ? .blue : .black)
                    .padding(8)
                    .background(isActive ? Color.white: Color.clear)
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
}


