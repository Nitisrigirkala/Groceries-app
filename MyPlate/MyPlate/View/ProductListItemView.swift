//
//  ProductView.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import SwiftUI

struct ProductListItemView: View {
    
    let product: Product
    var body: some View {
        VStack {
            ProductImageView(image: UIImage(named: product.image))
                .frame(width: 170, height: 190)
            Text(product.title)
                .foregroundColor(.darkText)
                .bold()
                .font(.title2)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            HStack(alignment: .center, content: {
                Text("\(product.price.format(f: ".2"))$").bold()
                    .foregroundColor(.darkText)
                Text("per \(product.pricePerQuantity)")
                    .font(.caption)
                    
            })
            HStack(spacing: 2) {
                Text("\(product.formatedRating)").font(.title3)
                    .foregroundColor(.darkText)
                Text("(\(product.rating.count))").font(.caption2)
                    .foregroundColor(.secondary)
                    .offset(y: 3)
            }
        }.padding(8)
    }
}

struct ProductListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListItemView(product: ProductsViewModel().products?[0] ?? Product(id: 1, title: "Sample Product", price: 10.2, description: " This is sample product", category: "sample", image: "cart", rating: Rating(rate: 4.4), pricePerQuantity: "lb"))
            .previewLayout(.fixed(width: 120, height: 150))
    }
}

struct ProductImageView: View {
    let image: UIImage?
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(12)
                .overlay(
                    ZStack {
                            HStack {
                                Spacer()
                                if let image = image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .compositingGroup()
                                        .aspectRatio(contentMode: .fit)
                                }
                                
                                Spacer()
                            }
                    }.padding()
                )
        }
        .cornerRadius(12)
        .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .aspectRatio(contentMode: .fit)
    }
}
