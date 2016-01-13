//
//  AccountManager.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation

class AccountManager {
    static var name: String? {
        
        if let path = NSBundle.mainBundle().pathForResource("AccountCredentials", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            return dictionary!["Name"] as? String
        } else {
            return nil
        }
    }

    static var password: String? {
        if let path = NSBundle.mainBundle().pathForResource("AccountCredentials", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            return dictionary!["Password"] as? String
        } else {
            return nil
        }
    }
}
