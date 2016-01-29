//
//  RealmStore.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import RealmSwift

class RTranslation: Object {
    dynamic var word1Text = ""
    dynamic var word2Text = ""
}

class RTranslationList: Object {
    dynamic var name = ""
    dynamic var language1Code = ""
    dynamic var language2Code = ""
    let translations = List<RTranslation>()
}