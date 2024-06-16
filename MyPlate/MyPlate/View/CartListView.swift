//
//  CartListView.swift
//  MyPlate
//
//  Created by Nitisri on 07/05/23.
//

import SwiftUI

struct CartListView: View {
    @ObservedObject var cartViewModel: CartViewModel
    var productsDict: [Product: Int]
    var body: some View {
        let products = productsDict.map({$0.key})
        List {
            ForEach(products) { product in
                VStack {
                    CartListItemView(cartViewModel: cartViewModel, product: product)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listRowBackground(Color.cardBG)
                .cornerRadius(15)
                .listRowSeparatorTint(.none)
                
            }
        }
        .background(Color.background)
    }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        let product = ProductsViewModel().products?[0] ?? Product(id: 1, title: "Sample Product", price: 10.2, description: " This is sample product", category: "sample", image: "cart", rating: Rating(rate: 4.4), pricePerQuantity: "pice")
        let product1 = ProductsViewModel().products?[1] ?? Product(id: 1, title: "Sample Product", price: 10.2, description: " This is sample product", category: "sample", image: "cart", rating: Rating(rate: 4.4), pricePerQuantity: "lb")
        CartListView(cartViewModel: CartViewModel(), productsDict: [product: 1,
                                                                   product1: 2] )
    }
}
