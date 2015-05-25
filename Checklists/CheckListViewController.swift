//
//  ViewController.swift
//  Checklists
//
//  Created by Brad Gray on 5/24/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("CheckListItem")
                as! UITableViewCell
            
            let label = cell.viewWithTag(1000) as! UILabel
            
            if indexPath.row % 5 == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Brush my Teeth"
            } else if indexPath.row % 5 == 2 {
                label.text = "Learn IOS Development"
            } else if indexPath.row % 5 == 3 {
                label.text = "soccer practice"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat ice cream"
            }
            
            
            return cell
            
    }
    
    
}

