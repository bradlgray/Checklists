//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Brad Gray on 5/29/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit
protocol AddItemViewControllerDelegate: class {
    func additemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}
class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?
   
    @IBAction func cancel() {
        delegate?.additemViewControllerDidCancel(self)
    }
    @IBAction func done() {
     let item = ChecklistItem()
    item.text = textField.text
    item.checked = false
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
}

