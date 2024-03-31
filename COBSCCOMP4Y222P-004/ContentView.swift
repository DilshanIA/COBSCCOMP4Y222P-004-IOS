//
//  ContentView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-13.
//

import SwiftUI

struct ContentView:  View {
    @State private var Loading = false
    @State private var Login = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Image2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Spacer()
                    
                    Text("Welcome to VogueVenue")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    
                    if Loading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(2)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onAppear {
              
                Loading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    Loading = false
                    Login = true
                }
            }
//            .background(
//                NavigationLink(destination: HomeView(), isActive: $Login) {
//                    EmptyView()
//                }
//                .hidden()
//            )
       
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
