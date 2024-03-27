//
//  TestView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct TestView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    @StateObject var productVM : MensViewModel = MensViewModel()
       
       @State var navigate : Bool = false
       
       @State var selectedProduct : Items?
    
  
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack{
                                  
                                  List{
                                      ForEach(productVM.products, id: \.id){
                                          product in productCard( product : product)
                                      }
                                  }
                                 
                              }
            
              
                }
            }
             }
    }


    @ViewBuilder func productCard (product : Items) -> some View {
           ZStack{
               RoundedRectangle (cornerRadius: 10)
                   .frame(height:130)
                   .foregroundColor(.white)
                   .shadow(color : .black.opacity(0.2),radius:6)
               HStack
               {
                   
                   VStack{
                       Text(product.ProductName ?? "")
                           .bold()
                           .frame(maxWidth: .infinity, alignment: .leading)
                       Text(product.Price ?? "")  .frame(maxWidth: .infinity, alignment: .leading)
                   }
               }.padding(.vertical,8)
                   .contentShape(Rectangle())
               //update selected movie and trigger navigaion
                   
                   
           }
       }
   

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        MensView()
    }
}
