//
//  HeaderView.swift
//  FoodApp
//
//  Created by Jigar on 5/27/23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders : OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass?
    var body: some View {
        VStack {
            if(vSizeClass ?? .regular) != .compact {
                ZStack(alignment: .bottomTrailing) {
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    // .scaledToFill()
                        .ignoresSafeArea()
                    Text("Pizza Company")
                        .font(.custom("Georgia", size: 30,relativeTo: .title))
                    //                .foregroundColor(Color("Sky"))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                }
            } else {
                HStack(alignment: .bottom){
                    Image("surfBanner")
                        .resizable()
                        .scaledToFit()
                    Text("Pizza Company")
                        .font(.custom("Georgia", size: 30,relativeTo: .title))
                    //                .foregroundColor(Color("Sky"))
                        .foregroundColor(Color("Surf"))
                        .fontWeight(.heavy)
                        
                }
            }
               
            
        }.background(.ultraThinMaterial)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel())
    }
}
