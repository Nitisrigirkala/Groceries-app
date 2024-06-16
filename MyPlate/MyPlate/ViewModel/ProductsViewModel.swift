//
//  ProductsViewModel.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import Foundation

enum Category: String, CaseIterable {
    
    case all = "All"
    case fruitsAndVegtables = "Fruits and Vegtables"
    case dairyProducts = "Dairy Products"
    case meat = "Meat"
    case buts = "Nuts"
    
}

class ProductsViewModel: ObservableObject {
    @Published var products: [Product]?
    @Published var category: Category = .all
    private var sourceProducts: [Product]?
    
    init() {
        if let fileUrl = Bundle.main.url(forResource: "products", withExtension: "json"),
           let data = try? Data(contentsOf: fileUrl){
            let jsonDecoder = JSONDecoder()
            sourceProducts = try? jsonDecoder.decode([Product].self, from: data)
        }
        loadProducts(category: .all)
    }
    
    func loadProducts(category: Category) {
        if category == .all {
            products = sourceProducts
        } else {
            products = sourceProducts?.filter({ product in
                return product.category.lowercased() == category.rawValue.lowercased()
            })
        }
    }
}
