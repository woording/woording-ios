//
//  User.swift
//  woording-ios
//
//  Created by Cor Pruijs on 31-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var name = ""
    dynamic var email = ""
    let translationListIdentifiers = List<TranslationListIdentifier>()
    
    convenience init(name: String, email: String) {
        self.init()
        self.name = name
        self.email = email
    }
}
