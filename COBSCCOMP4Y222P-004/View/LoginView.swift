//
//  LoginView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI

struct LoginView: View {
    @State private var isLogged: Bool = false
    
    var body: some View {
        ZStack {
        
            Image("Image3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
            
        
            VStack {
                Spacer()
                LoginDetailsView(isLogged: $isLogged)
                
                Spacer()
                SignupView()
            }
            .padding()
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $isLogged) {
            HomeView()
        }
    }
}

struct LoginDetailsView: View {
    @Binding var isLogged: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) { // Align center
            Text("Login")
                .font(.custom("AmericanTypewriter", size: 30))
                .fontWeight(.black)
                .padding(.horizontal)
                .foregroundColor(.black)
            
            TextField("Enter the Phone Number", text: $email)
                 .padding()
                 .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                 .padding()
                 .background(Color.white.opacity(0.7))
                 .frame(maxWidth: 400)
         
            
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                .padding(.horizontal)
                .background(Color.white.opacity(0.7))
                .frame(maxWidth: 400)
            NavigationLink(destination: ForgetPassword().navigationBarBackButtonHidden(true)) {
                HStack {
                    Text("Forget Your Password?")
                        
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.red)
                }
                .foregroundColor(.black)
                .padding(.horizontal)
              
            }
            
            Button(action: {
                isLogged = true
            }) {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.yellow)
                            .shadow(color: .white,radius: 20, x: 0, y: 2)
                    )
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}


struct SignupView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up With Social Media")
            
            HStack(spacing: 20) {
                SocialMediaButton(name: "google") {}
                SocialMediaButton(name: "facebook") {}
            }
        }
        .padding(.horizontal)
    }
}

struct SocialMediaButton: View {
    let name: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(name)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 70, height: 70)
        .background(Circle().stroke(Color.gray, lineWidth: 1))
    }
}

struct ForgetPassword: View {
    var body: some View {
        Text("Forget Password")
    }
}

//struct HomeView: View {
//    var body: some View {
//        Text("Home")
//    }
//}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
