//
//  MenuItemDetailsView.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/27/24.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                LittleLemonLogo()
                Text("Price").font(.title2)
                Text(formatPrice(menuItem.price))
                Text("Ordered").font(.title2)
                Text(String(menuItem.ordersCount))
                Text("Ingredients").font(.title2)
                VStack{
                    ForEach(menuItem.ingredients, id: \.self) { ingredient in
                        Text(ingredient.rawValue)
                    }
                }
            }
        }
        .navigationTitle(menuItem.title)
    }
}

#Preview {
    var sampleMenuItem = MenuItem(title: "Food 1", ingredients: [.broccoli, .carrot], price: 1.99, category: .food, ordersCount: 1)
    NavigationStack {
        MenuItemDetailsView(menuItem: sampleMenuItem)
    }
}

func formatPrice(_ price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    
    return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
}
