//
//  MenuItemsOptionView.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/27/24.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var viewModel: MenuViewViewModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                List{
                    Section(header: Text("SELECTED CATEGORIES")){
                        Toggle(MenuCategory.food.rawValue, isOn: $viewModel.filters.showFood)
                        Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.filters.showDrink)
                        Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.filters.showDessert)
                    }
                    Picker("SORT BY", selection: $viewModel.selectedSort) {
                        ForEach(SortBy.allCases, id: \.self) { sort in
                            Text(sort.rawValue).tag(sort)
                        }
                    }
                    .pickerStyle(.inline)
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Filter")
            .toolbar {
                    Button("Done") {
                        isPresented = false
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var isPresented = true
    MenuItemsOptionView(isPresented: $isPresented).environmentObject(MenuViewViewModel())
}
