//
//  CVButton.swift
//  Pods
//
//  Created by Cristian Villaseca on 5/5/16.
//
//

import UIKit

class CVButton: UIButton {
    
    let buttonMargin:CGFloat = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        self.frame = CGRectMake(50, 70, 40, 40);
        self.backgroundColor = UIColor(white: 0.6, alpha: 0.7)
        self.showsTouchWhenHighlighted = true
        setTransparentWithAnimation();
        
    }
    
    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.masksToBounds = true;
    }
    
    //MARK: touch events
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.backgroundColor = UIColor(white: 0.6, alpha: 0.7)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = event?.allTouches()?.first
        let window = UIApplication.sharedApplication().keyWindow
        let touchLocation = touch?.locationInView(window)
        self.center = touchLocation!
        self.touchesCancelled(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        var frame = self.frame;
        let screenLimit = UIScreen.mainScreen().bounds;
        var change = false;
        
        if (self.frame.origin.x < buttonMargin) {
            change = true;
            frame.origin.x = buttonMargin;
        }
        
        if (self.frame.origin.y < buttonMargin) {
            change = true;
            frame.origin.y = buttonMargin;
        }
        
        if (self.frame.origin.x + self.frame.size.width > screenLimit.size.width - buttonMargin ) {
            change = true;
            frame.origin.x = screenLimit.size.width - buttonMargin - frame.size.width ;
            
        }
        
        if (self.frame.origin.y + self.frame.size.height > screenLimit.size.height - buttonMargin ) {
            change = true;
            frame.origin.y = screenLimit.size.height - buttonMargin - frame.size.height ;
        }
        
        if (change) {
            UIView.animateWithDuration(0.6, animations: {
                self.frame = frame;
            })
        }
        
        setTransparentWithAnimation();
        
        super.touchesEnded(touches, withEvent: event)
    }
    
    //mark: private methods
    
    private func setTransparentWithAnimation() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(4 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            UIView.animateWithDuration(0.3, animations: {
                self.backgroundColor = UIColor(white: 0.8, alpha: 0.4)
            })
        }
    }
    
    
}
