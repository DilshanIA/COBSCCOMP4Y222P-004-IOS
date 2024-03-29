//
//  MensCategoryView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-29.
//

import SwiftUI

struct MensCategoryView: View {
    @State private var search: String=""
    @State private var selectedIndex: Int = 1
    
    private let maincategories = ["All", "Casual Wear", "Formal Wear", "Accessories"]
    
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(.white), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        Line1View()
                        .padding()
                        
                        SerachView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< maincategories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        MainCategoryView(isActive: selectedIndex == i, text: maincategories[i])
                                    }
                                }
                            }
                            .padding()
                        }
//                        OfferView()
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 1)
//                                )
                        
                        LinearGradient(gradient: Gradient(colors: [Color(.gray), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        
                    }
                }
            }
        }
        
    }
}
struct Line1View: View{
    var body: some View{
        Text("Mens")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.black)
            + Text("Category")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.black)

  }
}

struct SerachView:View{
    @Binding var search: String
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fixedSize()
                    .padding(.trailing, 10)
                TextField("Search for Products", text: $search)
                    .padding(.vertical,10)
                    .padding(.horizontal,8)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x:0, y:0)
            
            Button(action: {
                
            }){
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

struct MainCategoryView: View{
    let isActive: Bool
    let text: String
    
    var body: some View{
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.white: Color.black)
                .padding(8)
                .background(isActive ? Color.blue: Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.trailing)
    }
}

struct OfferView: View{
    let offerImages = ["offer1", "offer2", "offer3"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0) {
                ForEach(offerImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                }
                
                ForEach(offerImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                }
            }
        }
    }
}

struct ProductCartView: View{
    let image: Image
    let brandName: String
    let size: CGFloat
    
    var body: some View{
        VStack{
            image
                .resizable()
                .frame(width: size, height: 100 * (size/75))
                .cornerRadius(10.0)
            Text(brandName)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 2) {
                ForEach(0..<5) {_ in
                    Image("start")
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
#Preview {
    MensCategoryView()
}
