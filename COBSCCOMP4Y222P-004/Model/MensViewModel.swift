//
//  MensViewModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import Foundation

struct MensViewModel: Codable{
let Products : [Items]?
}

struct Items:Codable {
let ProductName : String
let  Price: String
let color : Double
let size : String
let description : String
let Size : Int
let id: Int
}

