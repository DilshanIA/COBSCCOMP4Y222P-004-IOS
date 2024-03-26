//
//  MensView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct MensView: View {
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
                        
                        SearchAndScanView(search: $search)
                        
                    
                        
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
           MensView()
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
    
    
    struct CardModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding() // Add padding inside the card
                .background(Color.white) // Set background color
                .cornerRadius(20) // Apply rounded corners
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5) // Add shadow
        }
    }

}
