//
//  DetailsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //    var selectedProduct : Items?
    //    var body: some View {
    //        ZStack {
    //            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1568627451, green: 0.4, blue: 0.662745098, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
    //                .ignoresSafeArea()
    //            Color("Bg")
    //            ScrollView  {
    //                    Image("nolimitDetails")
    //                        .resizable()
    //                        .aspectRatio(1,contentMode: .fit)
    //                        .edgesIgnoringSafeArea(.top)
    //
    //                DescriptionView()
    //
    //            }
    //            .edgesIgnoringSafeArea(.top)
    //
    //            HStack {
    //
    //                Text("LKR 1,890.00")
    //                    .font(.system(size: 20))
    //                    .foregroundColor(.white)
    //                Spacer()
    //                Text("Add to Cart")
    //                    .font(.title3)
    //                    .fontWeight(.semibold)
    //                    .foregroundColor(Color.white)
    //                    .padding()
    //                    .padding(.horizontal, 8)
    //                    .background(Color.blue)
    //                    .cornerRadius(10.0)
    //
    //            }
    //            .padding()
    //            .padding(.horizontal)
    //            .background(Color.gray)
    //
    //            .frame(maxHeight: .infinity, alignment: .bottom)
    //            .edgesIgnoringSafeArea(.bottom)
    //        }
    //        .navigationBarBackButtonHidden(true)
    //    }
    //}
    //
    //struct DescriptionView: View {
    @State private var rating: Int = 0
    @State private var selectedSizeIndex = 0
    var selectedProduct : Items?
    @State private var quantity: Int = 1
    
    var totalPrice: Float {
        let pricePerItem = Double(selectedProduct?.Price ?? 0) ?? 0
        return Float(pricePerItem * Double(quantity))
    }

    let sizes = ["Small", "Medium", "X-Large"]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
            
                .ignoresSafeArea()
            VStack{
                
                ScrollView  {
                    Image("image1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    
                    
                        .edgesIgnoringSafeArea(.top)
                    HStack {
                        
                        Text("Rs.\(String(format: "%.2f", selectedProduct?.Price ?? 0))")
                                   .fontWeight(.semibold)
                                   .foregroundColor(.black)
                                   .padding(.top, 8)
                        Spacer()
                        
                        Text("Add to Cart")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.horizontal, 8)
                            .cornerRadius(10.0)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                            )
                        
                        
                    }
                    
                    Text(selectedProduct?.Product_Name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Rate:")
                        ForEach(1..<6) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    rating = index
                                }
                        }
                        Text("(\(rating))/5")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    }
                    StepperView(quantity: $quantity)
                    Text(selectedProduct?.Description ?? "")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .opacity(0.6)
                    
                    Spacer()
                    
                    HStack {
                        
                        
                        Text("Rs.\(String(format: "%.2f", totalPrice))")// Display the total price
                                   .fontWeight(.semibold)
                                   .foregroundColor(.black)
                                   .padding(.top, 8)
                    }
                    
                    
                    
                    
                    HStack {
                        Text("Colors:")
                        HStack(spacing: 8) {
                            ColorCircleView(color: .red)
                            ColorCircleView(color: .green)
                            ColorCircleView(color: .blue)
                        }
                    }
                    
                    
                    
                    Picker(selection: $selectedSizeIndex, label: Text("Size")) {
                        ForEach(0..<sizes.count) { index in
                            Text(sizes[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.top, 8)
                    
                }
                
                .padding(12)
                
                
            }
           
        }
        
    }
  
    }
    




struct DetailViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
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
struct ColorCircleView: View {
    var color: Color
    
    var body: some View {
        color
            .frame(width: 20, height: 20)
            .clipShape(Circle())
    }
}

struct StepperView: View {
    @Binding var quantity: Int
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                            if quantity > 1 { // Ensure quantity doesn't go negative
                                quantity -= 1
                            }
                        }) {
                Image(systemName: "minus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x:0, y:2)
                  
                  
            }
            .frame(width: 40, height: 40)
            .background(Circle() .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom)))
            
            Text("\(quantity)")
                          .font(.title2)
                          .fontWeight(.semibold)
                          .padding(.horizontal, 12)
                          .background(
                              Capsule()
                                  .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                          )
           
            
            Button(action: {
                           quantity += 1
                       }) {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x:0, y:2)
            }
            .frame(width: 40, height: 40)
            .background( Circle() .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom)))
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 3)
            )
    }
}
struct BottomNavBarView2: View {
    var body: some View {
        HStack(spacing: 20) {
            BottomNavBarItem(image: Image(systemName: "house.fill"), label: "Home", action: {})
                .foregroundColor(.blue)
            BottomNavBarItem(image: Image(systemName: "heart.fill"), label: "Favorites", action: {})
                .foregroundColor(.gray)
            BottomNavBarItem(image: Image(systemName: "cart.fill"), label: "Shop", action: {})
                .foregroundColor(.gray)
            BottomNavBarItem(image: Image(systemName: "person.fill"), label: "Profile", action: {})
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.blue.opacity(0.8), radius: 10, x: 0, y: -5)
    }
}


#Preview {
    DetailsView()
}
