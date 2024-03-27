//
//  MensModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBMPC04PC02 on 2024-03-26.
//

import Foundation
struct MensModel : Codable {
    let Products : [Items]?
}

struct Items:Codable {
    let color : String
    let description : String
    let id : Int
  
}
