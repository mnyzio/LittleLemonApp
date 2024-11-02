//
//  Model.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/27/24.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var title: String { get }
    var ingredients: [Ingredient] { get }
    var price: Double { get }
    var category: MenuCategory { get }
    var ordersCount: Int { get set }
}

struct MenuItem: MenuItemProtocol, Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var ingredients: [Ingredient]
    var price: Double
    var category: MenuCategory
    var ordersCount: Int
}

class MenuViewViewModel: ObservableObject {
    var foodMenuItems = mockFoodItems
    var drinkMenuItems = mockDrinkItems
    var dessertMenuItems = mockDessertItems
    
    @Published var selectedSort: SortBy = SortBy.nameAscending {
        didSet {
            sortItems()
        }
    }
    @Published var filters = Filter(showFood: true, showDrink: true, showDessert: true)
    
    func sortItems() {       
        switch selectedSort {
        case .nameAscending:
            foodMenuItems.sort() { $0.title < $1.title }
            drinkMenuItems.sort() { $0.title < $1.title }
            dessertMenuItems.sort() { $0.title < $1.title }
        case .mostPopular:
            foodMenuItems.sort() { $0.ordersCount > $1.ordersCount }
            drinkMenuItems.sort() { $0.ordersCount > $1.ordersCount }
            dessertMenuItems.sort() { $0.ordersCount > $1.ordersCount }
        case .priceAscending:
            foodMenuItems.sort() { $0.price < $1.price }
            drinkMenuItems.sort() { $0.price < $1.price }
            dessertMenuItems.sort() { $0.price < $1.price }
        }
    }
}

// Filters
protocol FilterProtocol {
    var showFood: Bool { get set }
    var showDrink: Bool { get set }
    var showDessert: Bool { get set }

}

struct Filter: FilterProtocol {
    var showFood: Bool
    var showDrink: Bool
    var showDessert: Bool
}
