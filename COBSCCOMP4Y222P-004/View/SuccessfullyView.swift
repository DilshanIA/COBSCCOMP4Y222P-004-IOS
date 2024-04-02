//
//  SuccessfullyView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-04-02.
//

import SwiftUI

struct SuccessfullyView: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 350, height: 120)
                .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 2)
            HStack{
                Image("image4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .offset(x: -10, y: 0)
                
                Text("Payment Successfully !")
                    .aspectRatio(contentMode: .fit)
            }
            
        }
        .padding(.top,100)
     
            VStack {
                HStack {
                    Text("Item Total")
                        .font(.custom(Constants.AppFont.regularFont, size: 18))
                        .foregroundColor(Constants.AppColor.Black)
                    Spacer()
                    Text("Ru.1000.00")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.Black)
                }
                .padding(.top, 10)
                .padding(.horizontal, 40)
                
                HStack {
                    Text("Delivery Charges")
                        .font(.custom(Constants.AppFont.regularFont, size: 18))
                        .foregroundColor(Constants.AppColor.Black)
                    Spacer()
                    Text("Ru:150.00")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.Black)
                }
                .padding(.top, 5)
                .padding(.horizontal, 40)
                
                HStack {
                    Text("Discount")
                        .font(.custom(Constants.AppFont.regularFont, size: 18))
                        .foregroundColor(Constants.AppColor.Black)
                    Spacer()
                    Text("10%")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Color.init(hex: "036440"))
                }
                .padding(.top, 5)
                .padding(.horizontal, 40)
                
                
                .padding(.vertical, 5)
                
                HStack {
                    Text("Total Amount")
                        .font(.custom(Constants.AppFont.boldFont, size: 20))
                        .foregroundColor(Constants.AppColor.Black)
                    Spacer()
                    Text("Ru: 1050.00")
                        .font(.custom(Constants.AppFont.boldFont, size: 20))
                        .foregroundColor(Constants.AppColor.Black)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 100)
                
             
            }
            .padding(.bottom, 150)
        VStack{
            BottomBar.BottomNavBarViewNew()
                .padding(.top,100)
        }
    }
   
}
            
#Preview {
    SuccessfullyView()
}
