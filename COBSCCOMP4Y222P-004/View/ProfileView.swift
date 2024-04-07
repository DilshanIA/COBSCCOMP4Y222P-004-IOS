//
//  ProfileView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            VStack {
                ProfilePicture()
                
                UserInfo()
                
                Spacer()
                MenuBar()
            }
            
            
        }}
   
 
}

struct ProfilePicture: View {
    var body: some View {
        Image(systemName: "person.circle.fill") // Placeholder image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .foregroundColor(.  yellow) // Customize color as needed
    }
}

struct UserInfo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: Dilshn Amarasinghe")
                .font(.title)
            
            Text("Address: 123 Main St, Dehiwala, SriLanka")
                .font(.subheadline)
            
            Text("Email: dilshanamarasinghe049@example.com")
                .font(.subheadline)
            
            Text("Phone Number: +1234567890")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

