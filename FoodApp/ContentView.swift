//
//  ContentView.swift
//  FoodApp
//
//  Created by Jigar on 5/26/23.
//

import SwiftUI

struct ContentView: View {
    var menu :[MenuItem]
    @StateObject  var orders:OrderModel = OrderModel()
    @State private var showOrder: Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    @State private var presentGrid : Bool = false
    var body: some View {
        TabView {
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                MenuItemView(item:$selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial,in: RoundedRectangle(cornerRadius: 10))
                
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else {
                    MenuView(menu:menu, selectedItem: $selectedItem)
                }
               
                
            }.tabItem{
                Label("Menu",systemImage: "list.bullet")
            }
            
            VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            StatusBarView(showOrder: $showOrder, presentGrid: $presentGrid)
//            if showOrder {
                OrderView(orders: orders)
                    .cornerRadius(10)
            }.tabItem{
                Label("Order",systemImage: "cart")
            }
            
            
        }
        .padding()
        .background(.linearGradient(colors: [.cyan,Color("Surf"),Color("Sky")], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu:MenuModel().menu)
            
    }
}



