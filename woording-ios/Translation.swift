//
//  Translation.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import RealmSwift


class Translation: Object {
    dynamic var language1Text = ""
    dynamic var language2Text = ""
    
    convenience init(language1Text: String, language2Text: String) {
        self.init()
        self.language1Text = language1Text
        self.language2Text = language2Text
    }
}
