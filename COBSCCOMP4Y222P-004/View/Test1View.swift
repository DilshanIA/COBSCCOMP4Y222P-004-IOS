//
//  Test1View.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct Test1View:  View {
    
    @StateObject var productVM : MensViewModel = MensViewModel()
        
        @State var navigate : Bool = false
        
        @State var selectedProduct : Items?
        
        var body: some View {
            NavigationView{
                ZStack{
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
        
        @ViewBuilder func productCard (product : Items) -> some View {
            
            ZStack{
                RoundedRectangle (cornerRadius: 10)
                    .frame(height:130)
                    .foregroundColor(.white)
                    .shadow(color : .black.opacity(0.2),radius:6)
                HStack
                {
                    
                    VStack{
                        Text(product.color ?? "")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(product.description ?? "")  .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.padding(.vertical,8)
                    .contentShape(Rectangle())
                //update selected movie and trigger navigaion
                    
                    
            }
        }
    }

#Preview {
    Test1View()
}
