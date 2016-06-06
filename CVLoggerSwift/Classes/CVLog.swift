//
//  CVLog.swift
//  Pods
//
//  Created by Cristian Villaseca on 5/5/16.
//
//

import UIKit

#if DEBUG
    func print(s:String) {
        var error:NSError? = nil
    }
#endif

class CVLog: NSObject {
    
//    func systemLogs() -> [String] {
//        let q = asl_new(UInt32(ASL_TYPE_QUERY))
//        let r = asl_search(nil, q)
//        var m = asl_next(r)
//        var log = [String]()
//        while m != nil {
//            let message = String.fromCString(asl_get(m, ASL_KEY_MSG))
//            let timeStamp = String.fromCString(asl_get(m, "CFLog Local Time"))
//            if let msg = message{
//                log.append("\(timeStamp!) | \(msg)")
//            }
//            m = asl_next(r)
//        }
//        asl_release(r)
//        return log

}
