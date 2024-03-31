//
//  Test34.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI

import URLImage
import SDWebImageSwiftUI


struct Test34: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var showGridView: Bool = false
    @StateObject var productVM: DetailsViewModel = DetailsViewModel()
    @State private var navigate: Bool = false
    @State private var selected: Items?
    
    private let categories = ["All", "Men's", "Women's", "Kids'", "Shoes", "Accessories"]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
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
                        
                      
                  
                        
                    }
                    getGridView(products: productVM.Products)
                }
                .padding(.vertical, 20)
                
                VStack {
                    Spacer()
                   
                    BottomNavBarView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
struct getGridView1: View {
    var products: [Items]
    @State private var navigate: Bool = false
    @State private var selectedProduct: Items?
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                    ForEach(products, id: \.id) { product in
                        ClothsItemView(product: product)
                        
                    }
                }
                .navigationTitle("Products").bold()
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
            RoundedRectangle (cornerRadius: 10)
                .frame(width:180, height:300)
                .foregroundColor(.white)
                .shadow(color : .black.opacity(0.5),radius:8)
            
            VStack{
                URLImage(URL(string: product.Image_url)!){image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(height: 150)}
                
                Text(product.Product_Name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("Rs.\(String(format: "%.2f", selectedProduct?.Price ?? 0))")
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
    

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Test34()
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
                    .background(Color.yellow)
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
                .background(isActive ? Color.yellow: Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.trailing)
    }
}

struct OfferPhotosView: View {
    let offerImages = ["offer1", "offer2", "offer3"]
    @State private var currentIndex = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(offerImages.indices, id: \.self) { index in
                    Image(self.offerImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                        .opacity(index == self.currentIndex ? 1 : 0)
                }
            }
        }
        .onAppear {
            self.startTimer()
        }
        .onDisappear {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % offerImages.count
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

