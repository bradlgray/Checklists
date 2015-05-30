//
//  ViewController.swift
//  Checklists
//
//  Created by Brad Gray on 5/24/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

    class ChecklistViewController: UITableViewController,
                        AddItemViewControllerDelegate{
    
       
        var items: [ChecklistItem]
      
        
        required init(coder aDecoder: NSCoder) {
            items = [ChecklistItem]()
            
            let row0item = ChecklistItem()
            row0item.text = "Walk the dog"
            row0item.checked = false
            items.append(row0item)
            
            let row1item = ChecklistItem()
            row1item.text = "Brush my teeth"
            row1item.checked = true
            items.append(row1item)
           
            
            let row2item = ChecklistItem()
            row2item.text = "Learn iOS development"
            row2item.checked = true
            items.append(row2item)
            
            
            let row3item = ChecklistItem()
            row3item.text = "Soccer practice"
            row3item.checked = false
            items.append(row3item)
            
            let row4item = ChecklistItem()
            row4item.text = "Eat ice cream"
            row4item.checked = true
            items.append(row4item)
            
            super.init(coder: aDecoder)
        }
        
        @IBAction func addItem() {
          let newRowIndex = items.count
            let item = ChecklistItem()
            item.text = "I am a new row"
            item.checked = false
            items.append(item)
            
            let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
            let indexpaths = [indexPath]
            tableView.insertRowsAtIndexPaths(indexpaths, withRowAnimation: .Automatic)
        }
        override func tableView(tableView: UITableView,
            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
            forRowAtIndexPath indexPath: NSIndexPath) {
            // 1
            items.removeAtIndex(indexPath.row)
            // 2
            let indexPaths = [indexPath]
                tableView.deleteRowsAtIndexPaths(indexPaths,
                                                withRowAnimation: .Automatic)
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }

        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        override func tableView(tableview: UITableView,
            numberOfRowsInSection: Int) -> Int {
                return items.count
        }
        
        override func tableView(tableView: UITableView,
            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("CheckListItem") as! UITableViewCell
                let item = items[indexPath.row]
                
                configureTextForCell(cell, withChecklistItem: item)
                configureCheckmarkForCell(cell, withChecklistItem: item)
                
                return cell
        }
        
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                let item = items[indexPath.row]
                item.toggleChecked()
                
                configureCheckmarkForCell(cell, withChecklistItem: item)
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        
        func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
            if item.checked {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        }
        
        func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
            let label = cell.viewWithTag(1000) as! UILabel
            label.text = item.text
        }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            //1 
            if segue.identifier == "AddItem" {
                let navigationController = segue.destinationViewController as! UINavigationController
                
                let controller = navigationController.topViewController
                                                    as! AddItemViewController
                controller.delegate = self
            }
        }

        func additemViewControllerDidCancel(controller: AddItemViewController) {
            dismissViewControllerAnimated(true, completion: nil)
        }
        func addItemViewController(controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
           let newRowIndex = items.count
            
            items.append(item)
            let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
            let indexPaths = [indexPath]
            tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
}
    
    
   
      
    
      
        





    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


