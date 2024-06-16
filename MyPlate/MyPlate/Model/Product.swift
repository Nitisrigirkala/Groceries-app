//
//  Product.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    var pricePerQuantity: String
    
    var formatedRating: String {
        var result = ""
        for _ in 0...Int(rating.rate){
            result.append("★")
        }
        while result.count<5{
            result += "☆"
        }
        return result
    }
}

struct Rating: Codable, Hashable {
    let rate: Double
    var count: Int = Int.random(in: 0...500)
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
