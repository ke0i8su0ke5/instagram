//
//  CommentData.swift
//  Instagram_clone
//
//  Created by 高崎 慶輔 on 2017/04/29.
//  Copyright © 2017年 Keisuke Takasaki. All rights reserved.
//

import Firebase
import FirebaseDatabase

class CommentData: NSObject {
    var id: String?
    var postId: String?
    var name: String?
    var comment: String?
    var date: NSDate?
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.postId = valueDictionary["postId"] as? String
        self.name = valueDictionary["name"] as? String
        self.comment = valueDictionary["comment"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
    }
}
