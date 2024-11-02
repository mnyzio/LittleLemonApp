//
//  MenuItemsView.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/27/24.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject var menuView = MenuViewViewModel()
    @State var isSheetPresented = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if menuView.filters.showFood {
                        VStack{
                            CategoryTitle(title: "Food")
                            MenuItemsGrid(categoryItems: menuView.foodMenuItems)
                        }
                    }
                    if menuView.filters.showDrink {
                        CategoryTitle(title: "Drinks")
                        MenuItemsGrid(categoryItems: menuView.drinkMenuItems)
                    }
                    if menuView.filters.showDessert {
                        CategoryTitle(title: "Desserts")
                        MenuItemsGrid(categoryItems: menuView.dessertMenuItems)
                    }
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                FilterButton(isSheetPresented: $isSheetPresented)
            }
        }
        .sheet(isPresented: $isSheetPresented) {
                MenuItemsOptionView(isPresented: $isSheetPresented).environmentObject(menuView)
        }
    }
}

#Preview {
    MenuItemsView()
}

struct FilterButton: View {
    @Binding var isSheetPresented: Bool
    var body: some View {
        Button(action: {
            isSheetPresented.toggle()
        }, label: {
            Image(systemName: "slider.horizontal.3")
        })
    }
}

struct CategoryTitle: View {
    var title: String
    var body: some View {
        HStack{
            Text(title).font(.title)
            Spacer()
        }.padding(.horizontal)
    }
}
