//
//  DetailsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI
import URLImage

struct DetailsView:  View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var rating: Int = 4
    @State private var selectedSizeIndex = 0
    var selectedProduct : Items?
    @State private var quantity: Int = 1
    @State private var addedToCart = false
    @State private var selectedColor: Color = .red
     let colors: [Color] = [.red, .green, .blue]
    @State private var size: String = ""
    @State private var selectedSize: String = ""
    
    
    var totalPrice: Float {
        let pricePerItem = Double(selectedProduct?.price ?? 0) ?? 0
        return Float(pricePerItem * Double(quantity))
    }
    
    let sizes: [String] = ["S", "M", "L", "XL"]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
            
                .ignoresSafeArea()
         
            VStack{
             
                ScrollView  {
                    Text(selectedProduct?.Product_Name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        if let imageUrlString = selectedProduct?.imageurl, let imageUrl = URL(string: imageUrlString) {
                            URLImage(imageUrl) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10)
                                    .shadow(color: Color.black.opacity(0.8), radius: 0, x: 0, y: 2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.blue.opacity(0.3), lineWidth: 10)
                                    )
                            }
                        } else {
                            EmptyView()
                        }
                    }



                    HStack {
                        
                        Text("Rs.\(String(format: "%.2f", selectedProduct?.price ?? 0))")
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .padding(.top, 8)
                        Spacer()
                        
//                        Button(action: {
//                            // Set addedToCart to true when Add to Cart button is tapped
//                            addedToCart = true
//                        }) {
//                            Text("Add to Cart")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.white)
//                                .padding()
//                                .padding(.horizontal, 5)
//                                .cornerRadius(5.0)
//                                .background(
//                                    Capsule()
//                                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
//                                )
//                        }
                        .sheet(isPresented: $addedToCart) {
                            // Pass selectedProduct to CartView
                            CartView(selectedProduct: selectedProduct)
                            
                        }
                        
                    }
                        
                        
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
                    
                    
                    VStack(alignment: .leading) {
                        Text("Product Details")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 18))
                            .foregroundColor(Constants.AppColor.Black)
                            .padding(.top, 10)
                            .padding(.horizontal, 15)
                        Text(selectedProduct?.Description ?? "")
                            .font(.custom(Constants.AppFont.lightFont, size: 13))
                            .foregroundColor(Constants.AppColor.Black)
                            .padding(.vertical, 8)
                            .lineSpacing(2)
                            .padding(.horizontal, 15)
                            .lineLimit(nil)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.white)
                    .padding(.top, -3)
                    Divider()
                
                        .padding(.init(top: 5, leading: 0, bottom: 10, trailing: 0))
                    
                        SelectColorView(selectedColor: $selectedColor, colors: colors)
 
                        SelectSizeView(selectedSize: $selectedSize, sizes: sizes)
 
                    }
                    HStack {
                             
                               
                               Text("Rs.\(String(format: "%.2f", totalPrice))")
                                   .fontWeight(.semibold)
                                   .foregroundColor(.black)
                                   .padding(.top)
                           }
                Button(action: {
                    addedToCart = true
                }) {
                    Text("Add To Cart")
                        .frame(height: 45)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(0)
                       
                }
                .padding(.horizontal, 0)
                .sheet(isPresented: $addedToCart) {
                                           CartView(selectedProduct: selectedProduct)
                                           
                                       }
                                       
                                   }
                    .padding(12)
                }
           
            }
       
        }
        

    

        
    




struct DetailViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
struct SelectColorView: View {
    @Binding var selectedColor: Color
    let colors: [Color]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Color")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 18))
                .foregroundColor(.black)
                .padding(.top, 10)
            
            HStack {
                Button(action: {
                   
                }) {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.red))
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.green))
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.blue))
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.yellow))
                }
                
                Spacer() // Pushes the content to the left side
            }
            Divider()
            .padding(.horizontal, 10)
        }
    }
}
struct SizeButton: View {
    var size: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(size)
                .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                .foregroundColor(isSelected ? Constants.AppColor.Red : Constants.AppColor.Black)
                .frame(width: 40, height: 30)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(isSelected ? Constants.AppColor.Red : Constants.AppColor.lightBlack, lineWidth: isSelected ? 1.0 : 0.3)
        )
    }
}
struct AddToCartButton: View {
    @State private var addedToCart = false
    var selectedProduct : Items?
    var body: some View {
        Button(action: {
            // Add action for button here
        }) {
            Text("Add To Cart")
                .frame(height: 45)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(.yellow)
                .foregroundColor(.black)
                .cornerRadius(0)
               
        }
        .padding(.horizontal, 0)
        .sheet(isPresented: $addedToCart) {
                                   CartView(selectedProduct: selectedProduct)
                                   
                               }
                               
                           }
    }

struct SelectSizeView: View {
    @Binding var selectedSize: String
    let sizes: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Size")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 18))
                .foregroundColor(.black)
                .padding(.top, 10)
            
            HStack {
                ForEach(sizes, id: \.self) { size in
                    SizeButton(size: size, isSelected: selectedSize == size) {
                        selectedSize = size
                    }
                }
                Spacer()
            }
            Divider()
            .padding(.top, 15)
            .padding(.bottom, 10)
        }
       
        .background(Color.white)
        .padding(.horizontal, 5)
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



#Preview {
    DetailsView()
}
