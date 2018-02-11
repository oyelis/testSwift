//
//  Meal.swift
//  TestProduct
//
//  Created by sashaIOS on 2/11/18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class Meal {
    
    init?(name: String, image: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        self.name = name
        self.image = image
        self.rating = rating
    }
    
    var name:String
    var image:UIImage?
    var rating:Int
}
