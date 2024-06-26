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
    
        let apiUrlString = "https://cobsccomp4y222p-004-ios-cw-api-1gz1.onrender.com/products/"
        guard let apiUrl = URL(string: apiUrlString) else { return }
        
        var apiUrlRequest = URLRequest(url: apiUrl)
        
        let apiUrlSession = URLSession(configuration: .default)
        
        apiUrlSession.dataTaskPublisher(for: apiUrlRequest)
            .map(\.data)
            .retry(3)
            .decode(type: MensModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
             
                switch completion {
                case .finished:
                    print("Data loading finished")
                case .failure(let error):
                    print("Error: \(error)")
                   
                }
            }, receiveValue: { model in
                guard let productArray = model.Products else { return }
                self.Products = productArray
            })
            .store(in: &cancellables)
    }
}

