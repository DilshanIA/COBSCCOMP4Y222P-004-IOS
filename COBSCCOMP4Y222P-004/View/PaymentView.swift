//
//  PaymentView.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import SwiftUI

struct PaymentView: View {
    @State private var paymentMethod: String = ""
      @State private var cardNumber: String = ""
      @State private var expirationDate: String = ""
      @State private var cvv: String = ""
      
      var body: some View {
          VStack {
              Text("Payment")
                  .font(.title)
                  .padding()
              
              Picker("Payment Method", selection: $paymentMethod) {
                  Text("Credit Card").tag("credit_card")
                  Text("PayPal").tag("paypal")
                  Text("Apple Pay").tag("apple_pay")
              }
              .pickerStyle(SegmentedPickerStyle())
              .padding()
              
              if paymentMethod == "credit_card" {
                  TextField("Card Number", text: $cardNumber)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                  
                  HStack {
                      TextField("Expiration Date (MM/YY)", text: $expirationDate)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding()
                      
                      TextField("CVV", text: $cvv)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding()
                  }
              }
              
              Button(action: {
                  // Implement payment processing logic here
                  print("Processing payment using \(paymentMethod)")
                  print("Card Number: \(cardNumber)")
                  print("Expiration Date: \(expirationDate)")
                  print("CVV: \(cvv)")
              }) {
                  Text("Pay Now")
                      .font(.headline)
                      .foregroundColor(.white)
                      .padding()
                      .background(Color.blue)
                      .cornerRadius(10)
              }
              .padding()
              
              Spacer()
          }
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .shadow(radius: 5)
          .padding()
      }
  }
#Preview {
    PaymentView()
}
