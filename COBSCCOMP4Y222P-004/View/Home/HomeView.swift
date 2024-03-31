//
//  HomeView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import SwiftUI

struct HomeView: View {
    @State var index = 0
    var image = ["image"]
    @State private var selection: Int? = nil
    @State var view = false
    
    fileprivate func NavigationBarView() -> some View{
        return HStack{
            Spacer()
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeView()
}
