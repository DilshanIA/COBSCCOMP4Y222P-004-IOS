//
//  DetailsView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM on 2024-03-21.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5215686275, green: 0.7529411765, blue: 0.937254902, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Color("Bg")
            ScrollView  {
                    Image("nolimitDetails")
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                
                Text("LKR 1,890.00")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color.gray)

            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}






struct DetailViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
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

struct DescriptionView: View {
    @State private var rating: Int = 0
    @State private var selectedSizeIndex = 0
    let sizes = ["Small", "Medium", "X-Large"]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text("MARK JONES Polo Men's T-Shirt")
                .font(.title)
                .fontWeight(.bold)
            
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
            StepperView()
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            VStack (alignment: .leading, spacing: 8) {
                Text("* Brand: MARK JONES")
                Text("* Material: Single Jersey")
                Text("* Texture: Plain")
                Text("* Collar: Polo Collar")
                Text("* Sleeve: Short Sleeve")
                Text("* Color: Rose Brown")
                Text("* Size: \(sizes[selectedSizeIndex])")
            }
            .opacity(0.6)
            
            Spacer()
            
            HStack {
                Text("Price:")
                Text("LKR 1,890.00")
                    .fontWeight(.semibold)
            }
            
            HStack {
                Text("Colors:")
                HStack(spacing: 8) {
                    ColorCircleView(color: .red)
                    ColorCircleView(color: .green)
                    ColorCircleView(color: .blue)
                }
            }
            
         
            
            Picker(selection: $selectedSizeIndex, label: Text("Size")) {
                ForEach(0..<sizes.count) { index in
                    Text(sizes[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top, 8)
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .offset(x: 0, y: -30.0)
        
        Divider()
                  .padding(.top, 16)
                  .padding(.bottom, 8)
                  .background(Color.gray.opacity(0.2))
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
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                Image(systemName: "minus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .frame(width: 40, height: 40)
            
            Text("1")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 12)
                .background(Color.white)
                .clipShape(Capsule())
            
            Button(action: {}) {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .frame(width: 40, height: 40)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}


#Preview {
    DetailsView()
}
