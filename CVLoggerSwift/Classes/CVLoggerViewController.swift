//
//  CVLoggerViewController.swift
//  Pods
//
//  Created by Cristian Villaseca on 6/5/16.
//
//

import UIKit

protocol CVLoggerDelegate: class {
    func didCloseCVLogger()
}

class CVLoggerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    var selectedCell = -1
    
    let maxLength = 1500
    
    var collapseHeight:CGFloat = 150
    
    let cellIdentifier = "logCell"
    
    weak var delegate:CVLoggerDelegate?
    
    var logs:[String]?
    
    var searchLogs:[String]?
    
    let tableView:UITableView = UITableView(frame: CGRectZero, style: .Plain)
    
    var resultSearchController = UISearchController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCell = -1
        
        let bundlePath = NSBundle(forClass: CVLoggerViewController.self).pathForResource("CVLoggerSwift", ofType: "bundle")
        let bundle = NSBundle(path: bundlePath!)
        
        let close = UIImage(named: "close", inBundle: bundle, compatibleWithTraitCollection: nil)
        let share = UIImage(named: "share", inBundle: bundle, compatibleWithTraitCollection: nil)
        let delete = UIImage(named: "delete", inBundle: bundle, compatibleWithTraitCollection: nil)
        
        let shareButton = UIBarButtonItem(image: share, style: .Plain, target: self, action: #selector(CVLoggerViewController.share(_:)))
        let closeButton = UIBarButtonItem(image: close, style: .Plain, target: self, action: #selector(CVLoggerViewController.close(_:)))
        let deleteButton = UIBarButtonItem(image: delete, style: .Plain, target: self, action: #selector(CVLoggerViewController.clearLogs(_:)))
        
        self.navigationController?.navigationBar.barTintColor = UINavigationBar.appearance().tintColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItems = [closeButton,shareButton]
        self.navigationItem.leftBarButtonItem = deleteButton
        
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
            self.logs = CVLogManager.sharedManager.getLogs().reverse()
            dispatch_async(dispatch_get_main_queue(), { 
                self.tableView.reloadData()
            })
        }
    }
    
    //MARK: UITableViewDelegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            guard self.searchLogs != nil else {
                return 0
            }
            return self.searchLogs!.count
        }
        else {
            guard self.logs != nil else {
                return 0
            }
            return self.logs!.count
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var text:String
        if self.resultSearchController.active {
            text = self.searchLogs![indexPath.row]
        } else {
            text = self.logs![indexPath.row]
        }
        
        if (indexPath.row == self.selectedCell) {
            return self.heightForText(text)
        }else {
            return min(self.collapseHeight, self.heightForText(text));
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CVLoggerCell?
        
        if (cell == nil) {
            cell = CVLoggerCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        if indexPath.row % 2 == 1 {
            cell!.backgroundColor = UINavigationBar.appearance().tintColor.colorWithAlphaComponent(0.5)
        } else {
            cell!.backgroundColor = UIColor.whiteColor()
        }
        
        var recipe:NSString
        
        if self.resultSearchController.active {
            recipe = self.searchLogs![indexPath.row]
            
            let range = (recipe.lowercaseString as NSString).rangeOfString(self.resultSearchController.searchBar.text!.lowercaseString)
            
            let attributedRecipe = NSMutableAttributedString(string: recipe as String)
            
            let attributes = [NSBackgroundColorAttributeName:UIColor(colorLiteralRed: 245.0/255.0, green: 228.0/255.0, blue: 55.0/255.0, alpha: 1)]
            attributedRecipe.addAttributes(attributes, range: range)
            
            cell!.logLabel.attributedText = attributedRecipe;
            
            return cell!;
            
        } else {
            recipe = self.logs![indexPath.row]
        }
        
        
        
        if recipe.length > maxLength {
            recipe = recipe.substringToIndex(maxLength)
        }
        
        
        cell!.logLabel.text = recipe as String
        
        return cell!;

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedCell = indexPath.row
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.separatorInset = UIEdgeInsetsZero
        
        cell.preservesSuperviewLayoutMargins = false
        
        cell.layoutMargins = UIEdgeInsetsZero
    
    }

    
    //MARK: SearchDisplayController
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.searchLogs?.removeAll(keepCapacity: false)
        
        self.searchLogs = self.logs?.filter({ (str:String) -> Bool in
            return str == searchController.searchBar.text
        })
    
        self.tableView.reloadData()
    }
    

    
    
    //MARK: Private methods
    
    func configureView() {
        self.tableView.frame = self.view.frame
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        let views = ["tableView":self.tableView]
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|",
                                                                         options: NSLayoutFormatOptions(rawValue: 0),
                                                                         metrics: nil,
                                                                         views: views)
        self.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|",
                                                                     options: NSLayoutFormatOptions(rawValue: 0),
                                                                     metrics: nil,
                                                                     views: views)
        self.view.addConstraints(constraints)

        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.barTintColor = UINavigationBar.appearance().tintColor
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
    }

    
    
    //MARK: Action senders
    
    func close (sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
            self.delegate?.didCloseCVLogger();
        }
    }
    
    func share (sender: AnyObject) {
        
        guard (self.logs != nil) else {
            return;
        }
        
        var logs = String()
        for log in self.logs! {
            logs.appendContentsOf(log)
        }
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths.first
        let path = documentsDirectory?.stringByAppendingString("logs.txt")
        
        do {
            try logs.writeToFile(path!, atomically: true, encoding: NSUTF8StringEncoding)
            let fileURL = NSURL(fileURLWithPath: path!)
            let activityVC = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
        } catch {
            
        }
        
        
    }
    
    func clearLogs (sender: AnyObject) {
        CVLogManager.sharedManager.removeLogs()
        self.logs?.removeAll()
        self.tableView.reloadData()
    }
    
    

    
    
    
    func heightForText(text:String) -> CGFloat {
        let str = text as NSString
        
        let marginHeight:CGFloat = 8.0
        
        let marginWidth:CGFloat = 4.0
        
        let aLabelFont = UIFont(name: "HelveticaNeue", size: 14.0)
        
        let aLabelSizeWidth = self.view.bounds.size.width - (2*marginWidth);
        
        let options : NSStringDrawingOptions = [.UsesLineFragmentOrigin , .UsesFontLeading]
        var textHeight = str.boundingRectWithSize(CGSizeMake(aLabelSizeWidth, CGFloat.max), options: options, attributes: [NSFontAttributeName:aLabelFont!], context: nil).size.height
        
        if str.containsString("\n") {
            textHeight += 20.0
        }
        
        textHeight += (2*marginHeight);
        
        return  textHeight;

    }

}
