//
//  CartVeiw.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM on 2024-03-21.
//

import SwiftUI

struct CartView: View {
    
    let cartItems = ["Item 1", "Item 2", "Item 3"]
    let totalPrice = 100
    
    var body: some View {
        VStack {
            VStack {
                Text("Cart Items")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    ForEach(cartItems, id: \.self) { item in
                        // Customize appearance of each cart item
                        CartItemView(item: item)
                            .padding(.vertical, 4)
                    }
                }
                .border(Color.gray, width: 1)
                .cornerRadius(8)
                .padding()
            }
            
            Text("Total Price: $\(totalPrice)")
                .padding()
            
            Button(action: {
                
            }) {
                Text("Checkout")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Shopping Cart")
    }
    
    struct CartItemView: View {
        var item: String
        
        var body: some View {
            HStack {
                Text(item)
                    .padding(.horizontal)
                Spacer()
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
    
    struct CartView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CartView()
            }
        }
    }
}
