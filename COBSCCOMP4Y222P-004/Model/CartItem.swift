//
//  CartItem.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC07 on 2024-04-07.
//

import Foundation
import SwiftUI

struct CartItem: Identifiable, Codable {
    var id = UUID()
    var product: Items
    var quantity: Int
    var totalPrice: Float {
        Float(quantity) * Float(product.Price ?? 0.0)
    }
}

