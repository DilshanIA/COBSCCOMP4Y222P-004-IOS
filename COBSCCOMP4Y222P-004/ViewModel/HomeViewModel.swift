//
//  HomeViewModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC07 on 2024-04-07.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel :  ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var Products: [Items] = []
    
    init() {
        loadGetProduct()
    }
    
    func loadGetProduct() {
        let apiUrlString = "https://cobsccomp4y222p-004-ios-cw-api-1gz1.onrender.com/products/"
        
        guard let apiUrl = URL(string: apiUrlString) else { return }
        
        var apiUrlRequest = URLRequest(url: apiUrl)
        
        let apiUrlSession = URLSession(configuration: .default)
        
        apiUrlSession.dataTaskPublisher(for: apiUrlRequest)
            .map(\.data)
            .retry(3) // Retry the request up to 3 times if it fails
            .decode(type: MensModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                // Handle completion if necessary
                switch completion {
                case .finished:
                    print("Data loading finished")
                case .failure(let error):
                    print("Error: \(error)")
                    // Handle error if needed
                }
            }, receiveValue: { model in
                guard let productArray = model.Products else { return }
                self.Products = productArray
            })
            .store(in: &cancellables)
    }
}
