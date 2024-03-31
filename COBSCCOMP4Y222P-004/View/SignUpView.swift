//
//  SignUpView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var phonenumber: String = ""
    @State private var address: String = ""
    
    var body: some View {
        ZStack {
           
            Image("Image3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
          
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding(.bottom, 30)
                
                Text("Sign up for Clothing Sale App")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 18)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                TextField("Phone Number", text: $phonenumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                TextField("Address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(maxWidth: 400)
                
                Button(action: {
                    print("Username: \(username), Password: \(password), Email: \(email), Phone Number: \(phonenumber) , Address: \(address)")
                }) {
                    Text("Sign up")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .opacity(30)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SignUpView()
}
