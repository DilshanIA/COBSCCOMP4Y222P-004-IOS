//
//  MyCartView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI

struct MyCartView: View {
    
    
    @State var isShowPromoCodeView : Bool = false
    var discount = 0
    var deliveryCharges = 0
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Cart")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.lightBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func CheckOutButton() -> some View {
        Button(action: {
            
        }) {
            Text("CHECKOUT")
                .font(.custom(Constants.AppFont.boldFont, size: 15))
                .foregroundColor(.white)
                .frame(height: 44)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(22)
        }
        .padding(.init(top: 0, leading: 15, bottom: 5, trailing: 15))
    }
    
    fileprivate func ApplyCoupon() -> some View {
        return Button(action: {
            self.isShowPromoCodeView.toggle()
        }) {
            HStack {
                Image("offer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 15)
                    .foregroundColor(Constants.AppColor.lightBlack)
                
                Text("APPLY COUPON")
                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                    .foregroundColor(Constants.AppColor.lightBlack)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 15)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 30)
        .sheet(isPresented: $isShowPromoCodeView) {
          
        }
    }
    
    var body: some View {
        VStack {
            NavigationBarView()
            ScrollView {
                ZStack(alignment: .top) {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false, content: {
                         
                           
                        })
                        .disabled(false)
                      
                        
                     
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                        ApplyCoupon()
                     
                            .padding(.horizontal, 15)
                        
                        VStack {
                            HStack {
                                Text("Item Total")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("4999")
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
                                Text("50")
                                    .font(.custom(Constants.AppFont.boldFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                            HStack {
                                Text("Discount")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("10")
                                    .font(.custom(Constants.AppFont.boldFont, size: 13))
                                    .foregroundColor(Color.init(hex: "036440"))
                            }
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            
                          
                                .padding(.vertical, 5)
                            
                            HStack {
                                Text("Total Amount")
                                    .font(.custom(Constants.AppFont.boldFont, size: 16))
                                    .foregroundColor(Constants.AppColor.Black)
                                Spacer()
                                Text("20")
                                    .font(.custom(Constants.AppFont.boldFont, size: 16))
                                    .foregroundColor(Constants.AppColor.Black)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 5)
                            
                            Spacer()
                        }
                        .padding(.top, 2)
                    }
                }
            }
            .padding(.top, 5)
            Spacer()
            CheckOutButton()
        }
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}

struct ItemCellTypeThree: View {
    
 
    
    fileprivate func plusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "plus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
    
    fileprivate func minusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "minus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
    
    var body: some View {
        ZStack() {
            HStack(alignment: .top) {
                Image("Image1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 120)
                    .cornerRadius(1)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Text")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                            .foregroundColor(Constants.AppColor.Black)
                            .lineLimit(1)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(Color.init(hex: "bbbbbb"))
                                .padding(.top, 5)
                        }
                    }
                    
                    Text("pRODUCT")
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.Black)
                        .padding(.top, -5)
                    
                    HStack {
                        Text("Color:")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(.gray)
                        Text("Red")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(Constants.AppColor.Black)
                        
                        Text("Size:")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(.gray)
                        Text("XL")
                            .font(.custom(Constants.AppFont.regularFont, size: 13))
                            .foregroundColor(Constants.AppColor.Black)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    HStack {
                        HStack {
                            minusButton()
                            Text("1")
                                .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                                .foregroundColor(Constants.AppColor.Black)
                                .padding(.horizontal, 5)
                            plusButton()
                        }
                        .background(Constants.AppColor.lightGrayColor)
                        .cornerRadius(5)
                        .padding(.bottom, 10)
                        Spacer()
                        Text("4000")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                            .foregroundColor(Constants.AppColor.lightBlack)
                    }
                    
                }
                .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .frame(height: 130)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    MyCartView()
}
