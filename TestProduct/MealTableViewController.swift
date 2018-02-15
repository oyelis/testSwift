//
//  MealTableViewController.swift
//  TestProduct
//
//  Created by sashaIOS on 2/11/18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals = [Meal]()
    
    private func loadMealData() {
        let image1 = UIImage(named: "Image-1")
        let image2 = UIImage(named: "Image-2")
        let image3 = UIImage(named: "Image-3")
        let image = UIImage(named: "Image")
        guard let meal1 = Meal.init(name: "meal1", image: image1, rating:0) else {
            fatalError("Failed to initialize meal1")
        }
        guard let meal2 = Meal.init(name: "meal2", image: image2, rating:0) else {
            fatalError("Failed to initialize meal2")
        }
        guard let meal3 = Meal.init(name: "meal3", image: image3, rating:3) else {
            fatalError("Failed to initialize meal3")
        }
        guard let meal = Meal.init(name: "meal", image: image, rating:0) else {
            fatalError("Failed to initialize meal")
        }
        meals += [meal, meal1, meal2, meal3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        loadMealData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as? MealTableViewCell else {
            fatalError("Failed to get cell")
        }
        let obj:Meal = meals[indexPath.row]
        cell.displayView.image = obj.image
        cell.nameLabel.text = obj.name
        cell.rating.rating = obj.rating
        // Configure the cell...
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "ShowDetails":
            guard let selectedMealView = segue.destination as? MealViewController else {
                fatalError("Failed to get destination view")
            }
            guard let selectedCell = sender as? MealTableViewCell else {
                fatalError("wrong sender")
            }
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("Failed to get selected path")
            }
            let selectedMeal = meals[indexPath.row]
            selectedMealView.meal = selectedMeal
        case "addItem":
            print("add Item")
        default:
            fatalError("Wrong operation")
        }
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            if let selectedRow = tableView.indexPathForSelectedRow {
                meals[selectedRow.row] = meal
                tableView.reloadRows(at: [selectedRow], with: .none)
            } else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
