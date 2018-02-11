//
//  TestProductTests.swift
//  TestProductTests
//
//  Created by sashaIOS on 08.02.18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//
import XCTest
@testable import TestProduct

class TestProductTests: XCTestCase {
    
    func testMealInit(){
        let meal = Meal.init(name: "test", image: nil, rating: 10)
        XCTAssertNotNil(meal, "failed")
        let mealNil = Meal.init(name: "nil", image: nil, rating: -1)
        XCTAssertNil(mealNil, "failed")
    }
    
}
