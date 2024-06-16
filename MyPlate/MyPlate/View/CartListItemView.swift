//
//  CartListItemView.swift
//  MyPlate
//
//  Created by Nitisri on 07/05/23.
//

import SwiftUI

struct CartListItemView: View {
    @ObservedObject var cartViewModel: CartViewModel
    var product: Product
    @State var quantity: Int = 1
    var body: some View {
        HStack(spacing: 5) {
            ProductImageView(image: UIImage(named: product.image))
                .frame(width: 100, height: 100)
                .padding(.leading, 5)
            
            VStack(alignment: .leading, content: {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack(alignment: .center, content: {
                    Text("\(product.price.format(f: ".2"))$").bold()
                        .foregroundColor(.darkText)
                    Text("per \(product.pricePerQuantity)")
                        .font(.caption)
                        
                }) 
            })
            
            Picker(selection: $quantity, label: Text(""), content: {
                ForEach(1...10, id:\.self){quantity in
                    Text("\(quantity)")
                        .tag(quantity)
                        .foregroundColor(.darkText)
                }.onChange(of: quantity, perform: { value in
                    cartViewModel.changeQuantity(product: product, quantity: quantity)
                })
            })
            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            .padding(.trailing, 5)
            .foregroundColor(.darkText)
            VStack {
                Button {
                    cartViewModel.removeFromCart(product: product, quantity: quantity)
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.darkText)
                        .bold()
                }
                .buttonStyle(.bordered)

                Spacer()
            }
            
        }
        .background(Color.cardBG)
        .cornerRadius(15)
        .onAppear{
            if let quantity = cartViewModel.productsDict[product] {
                self.quantity = quantity
            }
        }
    }
}

struct CartListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartListItemView(cartViewModel: CartViewModel(), product: ProductsViewModel().products?[0] ?? Product(id: 1, title: "Sample Product", price: 10.2, description: " This is sample product", category: "sample", image: "cart", rating: Rating(rate: 4.4), pricePerQuantity: "lb"))
    }
}
