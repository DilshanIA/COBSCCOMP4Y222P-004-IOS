//
//  LoginView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-27.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
              
                VStack{
                    Spacer()
                    LoginPhotoView()
                    LoginDetailsView()
                }
                VStack{
                    HStack{
                        Button(action: {}){
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(width: 35, height: 35)
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
     
            }
        }
     
    }
}

struct LoginPhotoView : View {
    var body: some View {
        Image("login")
            .imageScale(.small)
            .opacity(0.5)
            .frame(width: 200, height: 200)
            .padding(.bottom, 20)
 
    }
}
struct LoginDetailsView: View{
    @State private var Email: String = ""
    @State private var Password: String=""
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            Text("Login")
                .font(.custom("AmericanTypewriter", size: 30))
                .fontWeight(.black)
                .padding(.horizontal)
            
            TextField("Enter The Email or Phone Number", text: $Email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Password", text: $Password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            NavigationLink(
                destination: ForgetPassword()
                    .navigationBarBackButtonHidden(true),
                label: {
                    HStack{
                        Text("Forget Your Password?")
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.red)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal)
                })
            Button(action: {
                
            }){
                Text("LOGIN")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            .shadow(color: .gray, radius: 2, x: 0 , y: 2)
                    )
            }
            .padding(.horizontal)
            }
        .padding(.vertical)
        }
    }

struct signupview:  View{
    var body: some View{
        VStack(spacing: 20){
            Text("Sign Up With Social Media")
            
            HStack(spacing: 20){
                SocialMediaButton(name: "google"){
                    
                }
                SocialMediaButton(name: "facebook"){
                    
                }
            }
        }
        .padding(.horizontal)
    }
}
struct SocialMediaButton: View{
    let name: String
    let action: () -> Void
    
    var body: some View{
        Button(action: action){
            Image(name)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 70, height: 70)
        .background(Circle().stroke(Color.gray, lineWidth: 1))
    }
}
    struct ForgetPassword: View{
        var body: some View{
            Text("Forget Password")
        }
    }
    #Preview {
        LoginView()
    }

