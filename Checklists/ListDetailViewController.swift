//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Brad Gray on 6/6/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

        protocol ListDetailViewControllerDelegate: class {
        
        func listDetailViewControllerDidCancel(controller: ListDetailViewController)
        
        
        func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist)
        
        func listDetailViewController(controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

    class ListDetailViewController: UITableViewController, UITextFieldDelegate {
        @IBOutlet weak var textField: UITextField!
        @IBOutlet weak var doneBarButton: UIBarButtonItem!
        
        weak var delegate: ListDetailViewControllerDelegate?
        
        var checklistToEdit: Checklist?
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        if let checklist = checklistToEdit {
            textfield.text = Checklist.name
            doneBarButton.enabled = true
        }
        
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
        
    }
@IBAction func done() {
    if let checklist = checklistToEdit {
    checklist.name = textField.text delegate?.listDetailViewController(self, didFinishEditingChecklist: checklist)
} else {
    let checklist = Checklist(name: textField.text) delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
    }
}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
}
func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool { let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange( range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
}


