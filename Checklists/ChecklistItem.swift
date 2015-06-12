//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Brad Gray on 5/25/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    
    func toggleChecked() {
        checked = !checked
    }
    override init() {
        super.init()
    }

    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    required init(coder aDecoder: NSCoder) {
   text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        
        super.init()
    }
             }
