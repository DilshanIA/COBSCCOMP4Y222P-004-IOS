//
//  NewView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI

struct NewView: View {
    
    @State var index = 0
    @State private var isModalPresentedForColor: Bool = false
    @State private var isModalPresentedForSize: Bool = false
    @State private var color: String = ""
    @State private var size: String = ""
   
    var arrImage = ["image1"]
    var arrSize = ["S", "M", "L", "XL"]
    var arrColor = ["800000", "FFA500", "2E8B57", "1E90FF", "708090"]
    
    fileprivate func NavigationBarView() -> some View {
        return HStack(alignment: .center) {
            Button(action: {
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Constants.AppColor.lightBlack)
            }
            .padding(.leading, 10)
            .frame(width: 40, height: 40)
            Spacer()
            FavoriteButton()
                .padding(.trailing, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Products")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.Black)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            
        }) {
            Image(systemName:  "heart.fill" )
                .foregroundColor( Constants.AppColor.lightBlack)
                .frame(width: 35, height: 35)
          
        }
        .cornerRadius(20)
        
    }
    fileprivate func ImageSlider() -> some View {
        return ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 0) {
                ForEach(self.arrImage, id: \.self) { imageName in
                
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .border(Color.black, width: 2)
                }
            }
        }
    }
    fileprivate func SimilerProduct() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                Text("Similar Products")
                    .font(.custom(Constants.AppFont.boldFont, size: 15))
                    .foregroundColor(Constants.AppColor.lightBlack)
                    .padding(.leading, 15)
                
                Spacer(minLength: 10)
                
                Button(action: {
                    
                }) {
                    Text("See All")
                        .padding(.trailing, 15)
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.Red)
                }
            }
            .padding(.top, 8)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
        
            })
        }.background(Color.white)
    }
    fileprivate func SelectSizeView() -> some View {
        return VStack(alignment: .leading) {
            Text("Select Size")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.lightBlack)
                .padding(.top, 10)
            
            SizeButtonsView(arrSize: arrSize, selectedSize: $size)
            
            Spacer()
        }
        .padding(.horizontal, 15)
        .background(Color.white)
        .padding(.bottom, 5)
    }

    struct SizeButtonsView: View {
        var arrSize: [String]
        @Binding var selectedSize: String
        
        var body: some View {
            HStack {
                ForEach(arrSize, id: \.self) { size in
                    SizeButton(size: size, selectedSize: $selectedSize)
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 10)
        }
    }

    struct SizeButton: View {
        var size: String
        @Binding var selectedSize: String
        
        var body: some View {
            Button(action: {
                self.selectedSize = size
            }) {
                Text(size)
                    .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                    .foregroundColor(selectedSize == size ? Constants.AppColor.Red : Constants.AppColor.lightBlack)
                    .frame(width: 40, height: 30)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(selectedSize == size ? Constants.AppColor.Red : Constants.AppColor.lightBlack, lineWidth: selectedSize == size ? 1.0 : 0.3)
            )
        }
            
    }
    var body: some View {
        VStack {
            NavigationBarView()
            ScrollView{
                ZStack{
                    Constants.AppColor.lightGrayColor
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        ImageSlider()
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("NIKE")
                                    .font(.title)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Spacer(minLength: 10)
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                                   Image(systemName: "strt.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .padding(.leading, 6)
                               
                                    Text("Rate")
                                        .font(.custom(Constants.AppFont.regularFont, size: 12))
                                        .foregroundColor(.white)
                                        .padding(.trailing, 6)
                                }.frame(height: 20)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            .padding([.horizontal], 15)
                            .padding(.top, 8)
                            
                            Text("TShirt")
                                .font(.custom(Constants.AppFont.lightFont, size: 13))
                                .foregroundColor(.black)
                                .lineLimit(nil)
                                .padding([.horizontal], 15)
                                .padding(.top, -5)
                                .padding(.bottom, 5)
                            
                            HStack{
                                Text("Text1")
                                    .font(.custom(Constants.AppFont.boldFont, size: 14))
                                    .foregroundColor(Constants.AppColor.lightBlack)
                                Text("1000")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(.gray) .strikethrough()
                                Text("5000")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.lightBlack)
                                Spacer()                            }
                        
                        }
                        .padding(.bottom, 8)
                        .padding(.horizontal, 15)
                    }
                    .background(Color.white)
                    .padding(.bottom, 5)
                    
                    SelectSizeView()
                }
            }
                
        }
    }
}

#Preview {
    NewView()
}
