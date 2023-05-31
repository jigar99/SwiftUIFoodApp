//
//  MenurowView.swift
//  FoodApp
//
//  Created by Jigar on 5/27/23.
//

import SwiftUI

struct MenurowView: View {
    var item : MenuItem
    var body: some View {
        HStack(alignment : .top,spacing: 15) {
            
            if let image = UIImage(named: "\(item.id)_sm") {
                Image(uiImage:  image)
                    .clipShape(Circle())
                    .padding(.trailing,-25)
                    .padding(.leading,-15)
            } else {
                Image("surfboard_lg")
            }
            VStack(alignment:.leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price,format: .currency(code: "USD"))
                }
                RatingView(rating: item.rating)
            }
            
        }
    }
}

struct MenurowView_Previews: PreviewProvider {
    static var previews: some View {
        MenurowView(item: testMenuItem)
    }
}
