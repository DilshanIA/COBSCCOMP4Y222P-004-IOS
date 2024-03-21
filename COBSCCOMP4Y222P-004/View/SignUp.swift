//
//  SignUp.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-13.
//

import SwiftUI

struct SignUp: View {
       @State private var username: String = ""
       @State private var password: String = ""
       @State private var email: String = ""
       @State private var phonenumber: String = ""
       @State private var address: String = ""
       
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
                   
                   Text("Sign up for Clothing Sale App")
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(.white)
                       .padding(.bottom, 18)
                   
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
                   
                   TextField("Email", text: $email)
                       .padding()
                       .background(Color.white.opacity(0.8))
                       .cornerRadius(8)
                       .padding(.horizontal)
                   
                   TextField("Phone Number", text: $phonenumber)
                       .padding()
                       .background(Color.white.opacity(0.8))
                       .cornerRadius(8)
                       .padding(.horizontal)
                   
                   TextField("Address", text: $address)
                       .padding()
                       .background(Color.white.opacity(0.8))
                       .cornerRadius(8)
                       .padding(.horizontal)
                   
                   Button(action: {
                       print("Username: \(username), Password: \(password), Email: \(email), Phone Number: \(phonenumber) , Address: \(address)")
                   }) {
                       Text("Sign up")
                           .foregroundColor(.white)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(Color.blue)
                           .cornerRadius(8)
                   }
                   .padding(.horizontal)
                   
                   Spacer()
               }
               .padding()
           }
           .navigationBarHidden(true)
       }
   }

   struct SignupView_Previews: PreviewProvider {
       static var previews: some View {
           SignUp()
       }
   }
