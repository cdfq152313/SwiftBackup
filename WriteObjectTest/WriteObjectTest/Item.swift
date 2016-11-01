//
//  Item.swift
//  WriteObjectTest
//
//  Created by denny on 10/31/16.
//  Copyright © 2016 denny. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding{
    var name:String?
    var detail:String?
    
    init(name:String, detail:String) {
        self.name = name
        self.detail = detail
    }
    
    required init?(coder aDecoder: NSCoder) {
        if name == nil{
            name = ""
        }
        if detail == nil{
            detail = ""
        }
        
        name = aDecoder.decodeObject(forKey: "name") as! String
        detail = aDecoder.decodeObject(forKey: "detail") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(detail, forKey: "detail")
    }
}
