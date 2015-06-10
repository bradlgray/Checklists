//
//  DataModel.swift
//  Checklists
//
//  Created by Brad Gray on 6/9/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    init() {
     loadChecklists()
        registerDefaults()
    }
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1]
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            as! [String]
        
        return paths[0]
    }
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("Checklist.plist")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists")
                    as! [Checklist]
                unarchiver.finishDecoding()
            }
        }

}
}