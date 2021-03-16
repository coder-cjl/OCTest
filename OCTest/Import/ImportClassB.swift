//
//  ImportClassB.swift
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/11.
//

import Foundation

@objc(ImportClassB)
public class ImportClassB: NSObject {
 
    @objc(ocSayHello)
    public func sayHello() {
        print("say hello")
        
        let a = ImportClassA()
        a.say()
    }
}
