//
//  MyPlateApp.swift
//  MyPlate
//
//  Created by Nitisri on 05/05/23.
//

import SwiftUI

@main
struct MyPlateApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(selectedCategory: .all)
        }
    }
}
