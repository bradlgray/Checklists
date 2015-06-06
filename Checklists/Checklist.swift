//
//  Checklist.swift
//  Checklists
//
//  Created by Brad Gray on 6/5/15
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
