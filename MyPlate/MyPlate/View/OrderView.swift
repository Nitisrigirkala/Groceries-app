//
//  OrderView.swift
//  MyPlate
//
//  Created by Nitisri on 07/05/23.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var cartViewModel: CartViewModel
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Thanks for shopping with us. \n Order Placed Successfly.")
                    .font(.title2)
                    .foregroundColor(Color.darkText)
                    .multilineTextAlignment(.center)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size:100))
                    .foregroundColor(Color.sucess)
                Text("Total: \(cartViewModel.totalPrice.format(f: ".2"))$")
                Button {
                    cartViewModel.removeAllItems()
                    NavigationUtil.popToRootView()
                } label: {
                    HStack {
                        Text("Continue shining").bold()
                        
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(15)
                }
                
            }
            
        }
        .navigationTitle(Text("Order Placed"))
        .navigationBarBackButtonHidden(true)
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(cartViewModel: CartViewModel())
    }
}

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.keyWindow?.windowScene?.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        return nil
    }
}
