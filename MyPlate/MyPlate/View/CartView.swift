//
//  CartView.swift
//  MyPlate
//
//  Created by Nitisri on 06/05/23.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject var cartViewModel: CartViewModel
    init(cartViewModel: CartViewModel) {
        self.cartViewModel = cartViewModel
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        let products = cartViewModel.productsDict.map({$0.key})
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                if products.isEmpty {
                    Image(systemName: "cart")
                        .font(.system(size: 100))
                        .bold()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.darkText)
                    Text("Cart is empty")
                        .foregroundColor(.darkText)
                    Text("Total: \(cartViewModel.totalPrice.format(f: ".2"))$")
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Continue shining").bold()
                            
                        }.padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(15)
                    }
                } else {
                    VStack {
                        Text("")
                        CartListView(cartViewModel: cartViewModel, productsDict: cartViewModel.productsDict)
                            .background(Color.background)
                        Text("Total: \(cartViewModel.totalPrice.format(f: ".2"))$")
                        NavigationLink(destination: OrderView(cartViewModel: cartViewModel)) {
                            HStack {
                                Text("Check out").bold()
                                Image(systemName: "creditcard")
                            }.padding()
                            .foregroundColor(.darkText)
                            .background(Color.buttongColor)
                            .cornerRadius(15)
                        }
                    }
                    
                }                
            }
            .onChange(of: cartViewModel.productsDict) { newValue in
                cartViewModel.calTotalValue()
            }
        }
        .navigationTitle("Cart")
        .onAppear {
            cartViewModel.calTotalValue()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: CartViewModel())
    }
}
