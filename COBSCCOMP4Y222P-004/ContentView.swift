//
//  ContentView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-13.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
        @State private var password: String = ""
        
        var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(.bottom, 30)
                    Spacer()
                    
                    Text("Welcome to DP ")
                                       .font(.title)
                                       .fontWeight(.bold)
                                       .foregroundColor(.white)
                                       .padding(.bottom, 20)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                   Spacer()
                    Button(action: {
                      
                        print("Username: \(username), Password: \(password)")
                    }) {
                        
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    Button(action: {
                                       // Sign up action
                                       print("Sign up tapped")
                                   }) {
                                       Text("Sign up")
                                           .foregroundColor(.blue)
                                           .padding()
                                   }
                                   .padding(.top, 10)
                                   
                                   Spacer()
                               }
                               .padding()
                           }
                           .navigationBarHidden(true)
                       }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
