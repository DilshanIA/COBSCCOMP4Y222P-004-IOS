//
//  ProductViewModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC02 on 2024-03-31.
//

import Foundation
import SwiftUI
import Combine


class ProductViewModel :  ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var Products: [Items] = []

    
    init() {
        loadGetProduct()
    }
    
    func loadGetProduct() {
    
        let apiUrlString = "https://ioscw.azurewebsites.net/products/"
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

