//
//  ViewController.swift
//  CVLoggerSwift
//
//  Created by Cristian Villaseca on 05/04/2016.
//  Copyright (c) 2016 Cristian Villaseca. All rights reserved.
//

import UIKit
import CVLoggerSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CVLoggerSwift"
        CVLogger.print("ViewController was loaded")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

