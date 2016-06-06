//
//  CVLogManager.swift
//  Pods
//
//  Created by Cristian Villaseca on 8/5/16.
//
//

import UIKit

class CVLogManager: NSObject {
    
    static let sharedManager = CVLogManager()
    
    let kLogs = "savedLogs"
    
    private override init() {
        super.init()
    }

    func addLog(log: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var logs = [String]()
        if let savedLogs = userDefaults.objectForKey(kLogs) as! [String]? {
            logs += savedLogs
        }
        
        logs.append(log)
        
        userDefaults.setObject(logs, forKey: kLogs)
        userDefaults.synchronize()
    }
    
    func getLogs() -> [String] {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        guard let logs = userDefaults.objectForKey(kLogs) as? [String] else {
            return [String]()
        }
        return logs
    }
    
    func removeLogs() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey(kLogs)
    }

}
