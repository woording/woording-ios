//
//  TranslationListIdentifier.swift
//  woording-ios
//
//  Created by Cor Pruijs on 31-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import RealmSwift

class TranslationListIdentifier: Object {
    dynamic var name = ""
    dynamic var language1Code = ""
    dynamic var language2Code = ""
    
    convenience init(name: String, language1Code: String, language2Code: String) {
        self.init()
        self.name = name
        self.language1Code = language1Code
        self.language2Code = language2Code
    }
}

