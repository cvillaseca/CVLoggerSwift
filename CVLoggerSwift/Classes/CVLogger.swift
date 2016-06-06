//
//  CVLogger.swift
//  Pods
//
//  Created by Cristian Villaseca on 6/5/16.
//
//

import UIKit


public class CVLogger: NSObject, CVLoggerDelegate {
    
    var btLogger:CVButton?
    let collapseHeight:CGFloat = 150
    
    public static func print(items: Any..., separator: String = "", terminator: String = "\n") {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        let dateString = formatter.stringFromDate(NSDate())
        Swift.print("\(items.first!)", separator: separator, terminator: terminator)
        CVLogManager.sharedManager.addLog("\(dateString)\n\(items.first!)")
    }

    
    public override init() {
        super.init()
        btLogger = CVButton(type: .Custom)
        if btLogger != nil {
            btLogger!.addTarget(self, action: #selector(touched), forControlEvents: UIControlEvents.TouchUpInside)
            let window = UIApplication.sharedApplication().keyWindow
            window?.addSubview(btLogger!)
        }

    }
    
    
    //Mark: Action senders
    
    func touched() {
        let loggerVC = CVLoggerViewController(nibName: nil, bundle: nil)
        loggerVC.collapseHeight = self.collapseHeight
        loggerVC.delegate = self
        let navController = UINavigationController(rootViewController: loggerVC)
        topMostViewController().presentViewController(navController, animated: true) { 
            self.btLogger?.hidden = true
        }
        
    }

        //Mark: Private methods
    func topMostViewController() -> UIViewController {
        var topController = UIApplication.sharedApplication().keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }

    //Mark: CVLoggerDelegate
    func didCloseCVLogger() {
        self.btLogger?.hidden = false
    }
}
