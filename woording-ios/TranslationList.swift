//
//  TranslationList.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation

typealias LanguageCode = String

struct TranslationList {
    var name: String
    var language1Code: LanguageCode
    var language2Code: LanguageCode
    var translations: [Translation]
}
