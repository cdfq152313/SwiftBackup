//
//  File.swift
//  PlayGroundLikeTest
//
//  Created by denny on 10/26/16.
//  Copyright © 2016 denny. All rights reserved.
//

import Foundation
class Dog{
    func eat(){
        print("Eatttt")
    }
    let name:String
    weak var baby:Baby?
    init (_ name:String){
        self.name = name
        print("\(name): Bornnn")
    }
    deinit {
        print("\(name): I am Dieeee QQ")
    }
}

class Baby{
    let name:String
    var dog:Dog?
    init(_ name:String){
        self.name = name
        print("\(name): Bornnn")
    }
    
    init(_ name:String, dog:Dog) {
        self.name = name
        self.dog = dog
    }
    deinit {
        print("\(name): I am Dieeee QQ")
    }
}

class Rabbit {
    let name: String
    var actionClosure: (() -> ())!
    init(name: String) {
        self.name = name
        self.actionClosure = {
            [unowned self] in
            if self != nil{
                print("我是全天下最可愛的\(self.name)")
            }
        }
    }
    func performAction() {
        actionClosure()
    }
    deinit {
        print("死了都要愛")
    }
}
