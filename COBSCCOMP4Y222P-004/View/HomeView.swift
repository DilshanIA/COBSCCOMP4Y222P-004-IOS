//
//  HomeView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI
import URLImage
import SDWebImageSwiftUI

struct HomeView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var showGridView: Bool = false
    @StateObject var productVM: ProductViewModel = ProductViewModel()
    @State private var navigate: Bool = false
    @State private var selected: Items?
    
    private let categories = [ "Men's", "Women's", "Kids'", "Shoes", "Accessories"]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        //TagLineView()
                      
                   
                        SearchAndScanView(search: $search)
                        OfferPhotosView()
                            .padding(.bottom)
                       
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {
                                        // Set the selectedIndex to the current index
                                        selectedIndex = i
                                        // Check if the selected index is Men's category
                                        if categories[i] == "Men's" {
                                            // Navigate to MensItemView
                                            // You can pass any necessary data here if needed
                                            navigate = true
                                        }
                                    }) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
    
                    }
                    getGridView(products: productVM.Products)
                }
                .padding(.vertical, 20)
                
                VStack {
                    Spacer()
                   
                    BottomBar.BottomNavBarViewNew()
                }
            }
            .navigationBarItems(trailing:
                         NavigationLink(destination: ProfileView()) {
                             Image(systemName: "person.fill")
                                 .foregroundColor(.black)
                         }
                     )
            // Navigate to MensItemView when navigate is true
            .sheet(isPresented: $navigate) {
                MensItemsView()
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
                    ForEach(products, id: \.id) { products in
                        ClothsItemView(product: products)
                        
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
                URLImage(URL(string: product.imageurl)!){image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(height: 150)}
                
                Text(product.Product_Name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("Rs.\(String(format: "%.2f", selectedProduct?.price ?? 0.0))")
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
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct TagLineView: View {
    var body: some View {
        Text("Welcome To ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.black).bold()
            + Text("Dilshan!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.black)
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
    let offerImages = ["offer1"]
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
 
 

