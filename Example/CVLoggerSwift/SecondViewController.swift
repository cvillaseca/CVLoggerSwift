//
//  SecondViewController.swift
//  CVLoggerSwift
//
//  Created by Cristian Villaseca on 21/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import CVLoggerSwift

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVC"
        CVLogger.print("SecondViewController was loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
