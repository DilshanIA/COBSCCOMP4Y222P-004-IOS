//
//  ProductModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-04-06.
//

import Foundation
struct ProductModel: Codable {
    let Products: [Items]?
}


struct Items: Codable {
    let availability: Int
    let _id: String
    let categoryID: String
    let Id : Double
    let Product_Name: String
    let Description: String
    let imageurl: String
    let price: Double
    let AvailabileQty: Int
    let Availablesize: [String]
    let Availablecolor: [String]
    let __v: Int
}

