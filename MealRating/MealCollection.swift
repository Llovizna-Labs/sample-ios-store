//
//  MealCollection.swift
//  MealRating
//
//  Created by Ronald J. Suez A. on 5/6/16.
//  Copyright © 2016 lloviznalabs. All rights reserved.
//

import UIKit


class MealCollection {
    
    var meals = [Meal]()
    
    init() {
        let photo1 = UIImage(named: "Meal1")!
        let meal1 = Meal(id: 1,name: "Caprese Salad", photo: photo1, rating: 4, price: 14.3)!
        
        let photo2 = UIImage(named: "Meal2")!
        let meal2 = Meal(id: 2,name: "Chicken and Potatoes", photo: photo2, rating: 5, price: 12.3)!
        
        let photo3 = UIImage(named: "Meal3")!
        let meal3 = Meal(id: 3,name: "Pasta with Meatballs", photo: photo3, rating: 3, price: 10.3)!
        
        self.meals  += [meal1, meal2, meal3]

    }
    
}