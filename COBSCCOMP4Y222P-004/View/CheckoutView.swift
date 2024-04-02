//
//  CheckoutView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-04-02.
//

import SwiftUI

struct CheckoutView: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""
    
    var body: some View {
        VStack {
            
            Text("Checkout")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.bottom, 0)
            
            ScrollView{
                VStack {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 120)
                            .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 2)
                            .padding()
                        
                        HStack{
                            Text("Order Item")
                                .font(.headline)
                                .foregroundColor(.black)
                                .offset(x: -85, y: 0)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom,80)
                            
                            
                            Text("Edit")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .offset(x: 115, y: 0)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom,80)
                            
                            VStack{
                                HStack{
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .font(.system(size: 30))
                                        .offset(x: 85, y: 0)
                                        .padding(.top, 70)
                                }
                            }
                        }
                        
                        VStack {
                            HStack{
                                Image("Image3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Image("Image3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Image("Image3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                            .offset(x: -90, y: 0)
                            
                        }
                    }
                }
                
                VStack(){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 200) // Increased height to accommodate additional content
                            .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 2)
                            .padding()
                        
                        
                        HStack{
                            Text("Delivery Address")
                                .font(.headline)
                                .foregroundColor(.black)
                                .offset(x: -80, y: 0)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 150)
                            
                            Text("Edit")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .offset(x: 73, y: -75)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 0)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Name: A.A.Isuru Dilshan Amarasinghe")
                            Text("Address: Hill Street, Dehiwala, Sri Lanka")
                            Text("Phone Number: 076-4271474")
                            Text("Note: Please handle with care")
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                        .offset(x: -18, y: 0)
                        
                        
                        VStack{
                            HStack{
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .font(.system(size: 30))
                                    .offset(x: 150, y: 0)
                                    .padding(.top, 150)
                            }
                        }
                    }
                }
                
                // Box 3
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 180) // Increased height to accommodate additional content
                            .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 2)
                            .padding()
                        
                        HStack{
                            Text("Payment Method")
                                .font(.headline)
                                .foregroundColor(.black)
                                .offset(x: -80, y: 0)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 150)
                            
                            Text("Edit")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .offset(x: 73, y: -75)
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 0)
                            
                            
                        }
                        HStack{
                            Image(systemName: "creditcard.fill")
                          
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .offset(x: -55, y: 0)
                            VStack(alignment: .leading) {
                                Text("***************6980")
                                Text("01/24")
                                
                            }
                            .offset(x: -40, y: 0)
                        }
                        VStack{
                            HStack{
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .font(.system(size: 30))
                                    .offset(x: 150, y: 0)
                                    .padding(.top, 130)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            VStack{
                HStack{
                    Button(action: {
                        
                    }) {
                        Text("Checkout")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    Button(action: {
                        
                    }) {
                        Text("Cancel")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            
            
            
        }
    }}


#Preview {
    CheckoutView()
}
