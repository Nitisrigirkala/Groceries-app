//
//  CartViewModel.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var productsDict: [Product: Int] = [:]
    @Published fileprivate(set) var totalPrice: Double = 0.0
    
    
    func addToCart(product: Product, quantity: Int) {
        if let existingQuantity = productsDict[product],
           existingQuantity > 0 {
            withAnimation {
                productsDict[product]! += quantity
            }
        } else {
            withAnimation {
                productsDict[product] = quantity
            }
        }
    }
    
    func changeQuantity(product: Product, quantity: Int) {
        withAnimation {
            productsDict[product] = quantity
        }
    }
    
    func removeFromCart(product: Product, quantity: Int) {
        if let existingQuantity = productsDict[product],
           existingQuantity > 0 {
            if existingQuantity > quantity {
                withAnimation {
                    productsDict[product]! += existingQuantity - quantity
                }
            } else {
                withAnimation {
                    productsDict.removeValue(forKey: product)
                }
            }
        }
    }
    
    func calTotalValue() {
        var total: Double = 0
        for (product, quantity) in productsDict {
            total += product.price * Double(quantity)
        }
        withAnimation{
            totalPrice = total
        }
    }
    
    func removeAllItems() {
        productsDict = [:]
    }
}
