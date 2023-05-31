//
//  StatusBarView.swift
//  FoodApp
//
//  Created by Jigar on 5/28/23.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrder : Bool
    @EnvironmentObject var orders:OrderModel
    @Binding var presentGrid : Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Button {
                showOrder.toggle()
            } label: {
                Image(systemName: showOrder ? "cart" : "menucard")
                    .font(.title2)
            }
            
            if !showOrder {
                Button {
                    presentGrid.toggle()
                } label: {
                    Image(systemName: presentGrid ? "square.grid.3x2" : "list.bullet")
                        .font(.title2)
            }
            }
            Spacer()
            Label{
                
                Text(orders.orderTotal,format: .currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart": "cart.circle.fill")
            }
        
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(showOrder: .constant(false), presentGrid: .constant(true)).environmentObject(OrderModel()).background(.black)
    }
}
