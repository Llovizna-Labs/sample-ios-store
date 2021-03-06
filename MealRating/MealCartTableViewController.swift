//
//  MealCartTableViewController.swift
//  MealRating
//
//  Created by Ronald J. Suez A. on 5/6/16.
//  Copyright © 2016 lloviznalabs. All rights reserved.
//

import UIKit
protocol mealCartCount {
    func updateCount()
}

class MealCartTableViewController: UITableViewController, ButtonCellDelegate {
    
    var meals = [Meal]()
    
    var delegate: mealCartCount? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //selectedMeals = mealCollection.selectedMeals

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - ButtonCellDelegate
    
    func buttonCellTapped(cell: MealCartDetailTableViewCell, add: Bool) {
        let index = self.tableView.indexPathForCell(cell)!.row;
        let meal = meals[index]
        
        if (add) {
            MealCollection.store.selectedMeals[meal.id]! += 1
        } else {
            MealCollection.store.selectedMeals[meal.id]! -= 1
        }
        
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        if(delegate != nil) {
            delegate?.updateCount()
        }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MealCartDetailTableViewCell"
        
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)  as! MealCartDetailTableViewCell
        
        //Configure the cell...
        cell.mealName.text = meal.name
        cell.mealImage.image = meal.photo
        cell.mealPrice.text = String(meal.price)
        cell.mealQuantity.text = String(MealCollection.store.selectedMeals[meal.id]!)
        
        if cell.buttonDelegate == nil {
            cell.buttonDelegate = self
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
