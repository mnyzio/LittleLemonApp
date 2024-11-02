//
//  MenuItemsGrid.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/27/24.
//

import SwiftUI

struct MenuItemsGrid: View {
    var categoryItems: [MenuItem]
    // Define grid layout with 3 columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 14) {
            ForEach(categoryItems, id: \.self) { categoryItem in
                NavigationLink(destination: MenuItemDetailsView(menuItem: categoryItem)){
                    VStack {
                        Image("LittleLemonLogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .background(Color.primary)
                            .clipped()
                            .cornerRadius(8)
                        Text(categoryItem.title)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    var _categoryItems = [
        MenuItem(title: "Food 1", ingredients: [.broccoli, .carrot], price: 1.99, category: .food, ordersCount: 1),
        MenuItem(title: "Food 2", ingredients: [.broccoli, .carrot], price: 2.99, category: .food, ordersCount: 2),
    ]
    
    MenuItemsGrid(categoryItems: _categoryItems)
}
