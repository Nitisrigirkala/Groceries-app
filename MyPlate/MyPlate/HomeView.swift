//
//  ContentView.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedCategory: Category
    @ObservedObject var productsViewModel = ProductsViewModel()
    @ObservedObject var cart: CartViewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                ScrollView(.vertical) {
                    VStack(alignment: .center) {
                        Text("Hello! \nFill your plate.")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        CategorySelectionView(categery: $selectedCategory)
                            .onChange(of: selectedCategory) { newValue in
                                productsViewModel.loadProducts(category: newValue)
                            }
                        VStack {
                            ProductListView(products: productsViewModel.products ?? [])
                                .environmentObject(cart)
                        }
                    }
                    Spacer(minLength: 30)
                }
            }
            //            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(Text("MyPlate"))
            .toolbarBackground(Color.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: {
                CartView(cartViewModel: cart)
            }, label: {
                Image(systemName: "cart")
                    .foregroundColor(.actionColor)
                    .imageScale(.large)
                    .overlay(
                        VStack {
                            if cart.productsDict.keys.count  > 0 {
                                ZStack {
                                    Circle().fill(Color.actionColor)
                                    Text("\(cart.productsDict.keys.count)")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer()
                            }
                        }.offset(x: 10, y: -10)
                            .shadow(color: .darkText.opacity(0.2), radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    )
            })
            )
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedCategory: .all, productsViewModel: ProductsViewModel()).environmentObject(CartViewModel())
    }
}
