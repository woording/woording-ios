//
//  Word.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
typealias LanguageCode = String

struct Word {
    var languageCode: LanguageCode
    var text: String
    init(LangCode : LanguageCode, Text : String){
        languageCode = LangCode
        text = Text
    }
}



struct List {
    let listName : String
    let lang1 : [Word]
    let lang2 : [Word]
    
    init(name : String, Lang1Words : [Word], Lang2Words : [Word]) {
        
        lang1 = Lang1Words
        lang2 = Lang2Words
        listName = name
        
        
        
    }
    
    
}