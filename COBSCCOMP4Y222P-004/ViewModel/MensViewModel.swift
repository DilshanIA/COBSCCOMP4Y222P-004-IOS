//
//  MensViewModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import Foundation
import SwiftUI
import Combine


class MensViewModel : ObservableObject {
    
    var compose = Set<AnyCancellable>()
    
    @Published var products : [Items] = []
    
    init()
    {
        loadGetProduct()
    }
    
    func loadGetProduct()
    {
        let getApiUrlString = "https://slmapioswebapi.azurewebsites.net/"
        guard let getApiUrlString = URL(string: getApiUrlString) else {return}
        var getApiUrlRequest = URLRequest (url : getApiUrlString)
        //session
        let getApiUrlSession = URLSession(configuration: .default)
        getApiUrlSession.dataTaskPublisher(for: getApiUrlRequest)
            .map(\.data)
            .retry(3)
            .decode(type: MensModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink{ res in
            }
    receiveValue: {model in
        guard let productArray = model.Products else { return}
        self.products = productArray
    }
    .store(in: &compose)
        
        
    }
        
    }
