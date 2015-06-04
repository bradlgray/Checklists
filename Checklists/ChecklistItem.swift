//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Brad Gray on 5/25/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
