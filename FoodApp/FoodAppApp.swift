//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Jigar on 5/26/23.
//

import SwiftUI

@main
struct FoodAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu:MenuModel().menu)
        }
    }
}
