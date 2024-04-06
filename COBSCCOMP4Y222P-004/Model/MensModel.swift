//
//  MensModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import Foundation
struct MensModel: Codable {
    let Products: [Items]?
}

struct Items: Codable {
    let _id: String
    let categoryID: String
    let id : Double
    let Product_Name: String
    let Description: String
    let imageurl: String
    let price: Double
    let Availability: Int
    let Availablesize: [String]
    let Availablecolor: [String]
    let __v: Int
}
