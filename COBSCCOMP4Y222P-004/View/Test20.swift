//
//  Test20.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-30.
//

import SwiftUI

struct Test20: View {
    var body: some View {
        NavigationView {
                   VStack {
                       NavigationLink(destination: CartView()) {
                           Text("Go to Cart")
                       }
                   }
                   .navigationTitle("Test")
               }
    }
}

#Preview {
    Test20()
}
