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

struct Items:Codable {
  let _id: String
    let subcategoryID:String
    let Product_name: String
    let id: Int
    let Description:String
    let Image_url: String
    let Price: Double
    let Availability:Int
    let Tags:[String]
    let availablesize:[String]
    let availablecolor:[String]
    let __v : Int
}


