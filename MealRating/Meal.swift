//
//  Meal.swift
//  MealRating
//
//  Created by Ronald J. Suez A. on 5/3/16.
//  Copyright © 2016 lloviznalabs. All rights reserved.
//

import UIKit

class Meal: Hashable {
    // MARK: Properties
    
    var id: Int
    var name: String
    var photo: UIImage?
    var rating: Int
    var price: Float
    var hashValue: Int {
        return self.id
    }
    
    
    // MARK: Initialization
    
    init?(id: Int, name: String, photo: UIImage?, rating: Int, price: Float) {
        
        
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.photo = photo
        self.rating = rating
        self.price = price
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}

func ==(lhs: Meal, rhs: Meal) -> Bool {
    return lhs.id == rhs.id
}


