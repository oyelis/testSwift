//
//  Meal.swift
//  TestProduct
//
//  Created by sashaIOS on 2/11/18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    //MARK: Archiving path properties
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    //MARK: data persistance
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKeys.name)
        aCoder.encode(image, forKey: PropertyKeys.image)
        aCoder.encode(rating, forKey: PropertyKeys.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKeys.name) as? String else {
            fatalError("Failed to decode name property")
            return nil
        }
        let image = aDecoder.decodeObject(forKey: PropertyKeys.image) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKeys.rating)
        self.init(name: name, image: image, rating: rating)
    }
    
    
    struct PropertyKeys {
        static let name = "name"
        static let image = "image"
        static let rating = "rating"
    }
    
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
