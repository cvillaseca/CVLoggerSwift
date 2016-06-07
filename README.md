# CVLoggerSwift

[![CI Status](http://img.shields.io/travis/cvillaseca/CVLoggerSwift.svg?style=flat)](https://travis-ci.org/cvillaseca/CVLoggerSwift)
[![Version](https://img.shields.io/cocoapods/v/CVLoggerSwift.svg?style=flat)](http://cocoapods.org/pods/CVLoggerSwift)
[![License](https://img.shields.io/cocoapods/l/CVLoggerSwift.svg?style=flat)](http://cocoapods.org/pods/CVLoggerSwift)
[![Platform](https://img.shields.io/cocoapods/p/CVLoggerSwift.svg?style=flat)](http://cocoapods.org/pods/CVLoggerSwift)

`CVLoggerSwift` is a tool that shows a button over UIWindow (only DEBUG build). When it pushed will show any log printed. 

![screenshot](https://cloud.githubusercontent.com/assets/7700085/13968554/b0c61910-f07d-11e5-9ced-33dadfe06c4a.gif)

[Show Appetize.io DEMO](https://appetize.io/app/kuz81bjqm91ucwzmtgeqpk55kc?device=iphone5s&scale=75&orientation=portrait&osVersion=9.2)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

In your AppDelegate.swift:
```swift
import CVLoggerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
var cvlogger: CVLogger?


func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

let storyboard = UIStoryboard(name: "Main", bundle: nil)
let mainVC = storyboard.instantiateInitialViewController()

if window != nil {
window = UIWindow(frame: UIScreen.mainScreen().bounds)
window?.rootViewController = mainVC
window?.makeKeyAndVisible()
}


// #if DEBUG //Set it in the "Swift Compiler - Custom Flags" section, "Other Swift Flags" line. You add the DEBUG symbol with the -D DEBUG entry.
cvlogger = CVLogger()
// #endif

CVLogger.print("Lorem ipsum dolor sit amet, at ridiculus fringilla tristique, ante commodo sed, commodo condimentum turpis, quam euismod praesent tincidunt. Erat vestibulum dui auctor dictumst sem in, ullamcorper sed morbi magna et suscipit dolore, consequatur ante laoreet, nisl eget. Sociis libero et sed euismod. Quis dictum lacus in quam, est duis integer pede facilisis mauris. In nec egestas lorem in morbi platea, enim aliquam consequat, cursus saepe blanditiis, ut risus malesuada quisque ornare ornare iaculis. Adipiscing dolor sed sed ut netus, ut at aenean interdum. Ligula sed adipiscing, adipiscing nisl pede eget adipisicing mauris proin, ac quam dui suspendisse diam ultrices massa. A a odio volutpat auctor.")

CVLogger.print("last log entry")

return true
}

```


## Requirements

`CVLoggerSwift` works on iOS 8+. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework

You will need the latest developer tools in order to build `CVLoggerSwift`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Installation

CVLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CVLoggerSwift"
```

## Author

Cristian Villaseca, cvillaseca_basco@hotmail.com

## License

CVLogger is available under the MIT license. See the LICENSE file for more info.
