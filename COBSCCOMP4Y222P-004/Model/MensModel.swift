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
    let id : Double
    let Product_Name : String
    let Subcategory_resId: String
    let Description: String
    let Price: String
    let Image_url: String
    let __v: Int
}
