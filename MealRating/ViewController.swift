//
//  ViewController.swift
//  MealRating
//
//  Created by Ronald J. Suez A. on 5/2/16.
//  Copyright © 2016 lloviznalabs. All rights reserved.
//

import UIKit

protocol mealCartDelegate {
    func addToCart(meal: Meal)
}


class ViewController: UIViewController {

    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var mealTitle: UILabel!
    
    var meal: Meal?
    
    var delegate: mealCartDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = meal!.name
        mealTitle.text = meal!.name
        mealImage.image = meal!.photo
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToCart(sender: AnyObject) {
        print("delegate")
        if (delegate != nil) {
            delegate?.addToCart(meal!)
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            print("delegate null")
        }
    }

}

