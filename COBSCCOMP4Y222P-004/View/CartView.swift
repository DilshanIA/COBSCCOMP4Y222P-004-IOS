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
    
    private func removeItem(at index: Int) {
            items.remove(at: index)
            saveItems()
        }
    
    private func addItemToCart() {
        guard let product = selectedProduct else { return }
        
        // Check if the product already exists in the cart
        if let existingItemIndex = items.firstIndex(where: { $0.name == product.Product_name }) {
            // Product already exists, update quantity
            items[existingItemIndex].quantity += 1
        } else {
            // Product doesn't exist, add it to the cart
            items.append(Item(name: product.Product_name,
                               image: product.Image_url,
                               details: product.Description,
                               quantity: 1))
        }
        
        saveItems()
    }
    
    
    var body: some View {

            VStack {
              
                    ScrollView{
                        Spacer()
                        
                        Image(systemName: "cart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                        
                        
                        VStack {
                            Text("Items in My Cart:")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top)
                            
                            ForEach(items.indices, id: \.self) { index in
                                Button(action: {
                                    self.selectedItem = items[index]
                                }) {
                                    ItemView(item: items[index])
                                }
                                Button(action: {
                                    
                                    items.remove(at: index)
                                   
                                    saveItems()
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                            
                        
                    }
                
                Spacer()
                VStack {
                    VStack {
                        VStack {
                            HStack {
                                Text("Item Total")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("Ru.1000.00")
                                    .font(.custom(Constants.AppFont.boldFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 15)
                            
                            HStack {
                                Text("Delivery Charges")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("Ru:150.00")
                                    .font(.custom(Constants.AppFont.boldFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                         
                            
                            
                            
                            .padding(.vertical, 5)
                            
                            HStack {
                                Text("Total Amount")
                                    .font(.custom(Constants.AppFont.boldFont, size: 16))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("Ru: 1050.00")
                                    .font(.custom(Constants.AppFont.boldFont, size: 16))
                                    .foregroundColor(Constants.AppColor.Black)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 5)
                            
                         
                        }
                         .padding(.top, 2)
                    
                
                        VStack {
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    
                                }) {
                                    Text("Checkout")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                }) {
                                    Text("Cancel")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.gray)
                                        .cornerRadius(10)
                                }
                                
                                Spacer()
                            }
                            .padding(.bottom)
                        }
                    }
                }
                .padding()
            }
                
                .onAppear {
                        loadItems()
                     addItemToCart()
                                
                    
                }
               
            }
        
        }



struct ItemCellTypeThree: View {
    var item: Item
    var body: some View {
        HStack {
            Image("Image3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(item.details)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("1")
                    
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct ItemView: View {


    var selectedProduct : Items?
  
    var item: Item
    @State private var quantity: Int = 1
    
    var body: some View {
        HStack {
            HStack{
                Image("Image3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                VStack{
                    HStack{
                        Text(item.name)
                            .font(.headline)
                        Spacer()
       
                    }
                    Spacer()
                    Text(item.details)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(item.details)
                        .font(.subheadline)
                        .foregroundColor(.gray)
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
                        Text("1")
                        Button(action: {
                            
                            if quantity < 10 {
                                quantity += 1
                            }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.title)
                        }
                        
                        .padding()
                        
                    }
                    
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            
            Spacer()
            
        }
        
        .frame(maxWidth: .infinity)
    }
}





struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

