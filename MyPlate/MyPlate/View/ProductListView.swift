//
//  ProductListView.swift
//  MyPlate
//
//  Created by Nitisri on 06/05/23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var cart: CartViewModel
    var products: [Product]
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(products) { product in
                VStack {
                    ProductListItemView(product: product)
                    
                    Button {
                        withAnimation {
                            cart.addToCart(product: product, quantity: 1)
                        }
                    } label: {
                        HStack {
                            Image(systemName: "cart.badge.plus")
                                .foregroundColor(.darkText)
                            
                            Text("Add to cart")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.darkText)
                        }
                        .padding(10)
                        .background(Color.buttongColor)
                        .cornerRadius(20)
                    }
                }
                .background(Color.cardBG
                                .cornerRadius(16)
                                .shadow(color: .darkText.opacity(0.05), radius: 2, x: 0.0, y: 0.0))
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: ProductsViewModel().products ?? [])
    }
}
