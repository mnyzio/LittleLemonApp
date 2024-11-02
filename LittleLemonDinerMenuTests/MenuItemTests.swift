//
//  MenuItemTest.swift
//  LittleLemonDinerMenuTests
//
//  Created by Miroslaw Nyzio on 11/2/24.
//


import XCTest
@testable import LittleLemonDinerMenu

final class MenuItemTests: XCTestCase {
    
    func test_menu_item_title() {
        let menuItem = MenuItem(title: "Food title mock", ingredients: [.broccoli,.pasta], price: 18.77, category: .food, ordersCount: 8)
        
        XCTAssertEqual(menuItem.title, "Food title mock")
    }
    
    func test_menu_item_ingredients() {
        let menuItem = MenuItem(title: "Food 2 title mock", ingredients: [.spinach,.tomatoSauce], price: 1.99, category: .food, ordersCount: 5)
        
        XCTAssertEqual(menuItem.ingredients, [.spinach,.tomatoSauce])
    }
    
}
