//
//  MealTableViewCell.swift
//  MealRating
//
//  Created by Ronald J. Suez A. on 5/2/16.
//  Copyright © 2016 lloviznalabs. All rights reserved.
//

import UIKit

protocol ButtonCellDelegate {
    func buttonCellTapped(cell: MealCartDetailTableViewCell, add: Bool)
}

class MealCartDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var mealQuantity: UILabel!
    
    var buttonDelegate: ButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func removeItem(sender: AnyObject) {
        if let delegate = buttonDelegate {
            delegate.buttonCellTapped(self, add: false)
        }
    }
    
    @IBAction func addItem(sender: AnyObject) {
        if let delegate = buttonDelegate {
            delegate.buttonCellTapped(self, add: true)
        }
    }
}
