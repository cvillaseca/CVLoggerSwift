//
//  CVLoggerCell.swift
//  Pods
//
//  Created by Cristian Villaseca on 9/5/16.
//
//

import UIKit

class CVLoggerCell: UITableViewCell {
    
    public var logLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.logLabel.textColor = UIColor.blackColor()
        self.logLabel.numberOfLines = 0;
        
        self.logLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        self.logLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.logLabel)
        
        let views = ["logLabel":self.logLabel]
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[logLabel]-8-|",
                                                                         options: NSLayoutFormatOptions(rawValue: 0),
                                                                         metrics: nil,
                                                                         views: views)
        self.contentView.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-4-[logLabel]-4-|",
                                                                         options: NSLayoutFormatOptions(rawValue: 0),
                                                                         metrics: nil,
                                                                         views: views)
        self.contentView.addConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
