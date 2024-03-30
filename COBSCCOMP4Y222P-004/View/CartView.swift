//
//  CartView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM on 2024-03-21.
//

import SwiftUI
struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var image: String
    var details: String
    var quantity: Int
}


struct CartView: View {
 
    var selectedProduct : Items?
    @State private var selectedItem: Item? = nil
      @State private var items: [Item] = []
    
    private func saveItems() {
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(items) {
               UserDefaults.standard.set(encoded, forKey: "cartItems")
           }
       }

   
       private func loadItems() {
           if let data = UserDefaults.standard.data(forKey: "cartItems") {
               let decoder = JSONDecoder()
               if let decoded = try? decoder.decode([Item].self, from: data) {
                   items = decoded
               }
           }
       }
    
    var body: some View {
     
        
        ScrollView {
            VStack {
        
                
                Spacer()
                
                Image(systemName: "cart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
               
                VStack {
                    Text("Items in My Cart:")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    ForEach(items, id: \.name) { item in
                        Button(action: {
                            self.selectedItem = item
                        }) {
                            ItemView(item: item)
                        }
                    }
                }
                
                Spacer()
           
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                       
                    }) {
                        Text("Checkout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Cancel")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
            }
            .padding()
            
            .onAppear {
                              loadItems()

                           
                              if let product = selectedProduct {
                                  items.append(Item(name: product.Product_Name,
                                                    image: product.Image_url,
                                                    details: product.Description,
                                                    quantity: 2))
                                  saveItems()
                }
               }
        }
    }
   
    
   }


struct ItemView: View {
    var item: Item
    
    var body: some View {
        HStack {
            VStack {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 50)
                
                Text(item.name)
                    .font(.headline)
                
                Text(item.details)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}


struct ItemDetailView: View {
    @State private var quantity: Int = 1
    
    var item: Item
    var addItemToCart: (Item) -> Void
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text(item.name)
                .font(.headline)
            
            Text(item.details)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                .padding()
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                }
                .padding()
                
                Button(action: {
                    
                    if quantity < 10 {
                        quantity += 1
                    }
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                .padding()
                
                Spacer()
                Button(action: {
                    let newItem = Item(name: item.name, image: item.image, details: item.details, quantity: quantity)
                    addItemToCart(newItem)
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

