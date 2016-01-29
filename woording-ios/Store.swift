//
// Swiffff
//  woording-ios
//
//  Created by Justin Sandhu on 1/29/16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation

//
// IMPORTANT MESSAGE:
//
// Hey i changed the datamodel to be bascially the same model on the API side. It's really simple actually.
// The change caused this code to break, though. So you'll have to update it to work the same as the new Model.
// Feel free to ask me any questions about the datamodel and how to use it on Slack.
//
//  - Cor
//

//class Store : NSObject {
//    
//    func readLocalListData() -> [List] {
//        var listArray : [List] = [] // is the return variable
//        
//        
//        //read from plist
//        
//        var optionalDict: NSDictionary?
//        if let path = NSBundle.mainBundle().pathForResource("Lists", ofType: "plist") {
//            optionalDict = NSDictionary(contentsOfFile: path)
//        }
//        
//        if let allTheLists = optionalDict {
//            for list in allTheLists {
//                
//                let listName = list.key as! String //read list name (key for        the diconaty represending the list)
//                
//                //build the lang1 array
//                let lang1 = list.value.valueForKey("lang1") as! [String]
//                let lang1Locale = list.value.valueForKey("lang1Locale") as! String //grab locale
//                
//                
//                
//                //build the lang2 array
//                let lang2 = list.value.valueForKey("lang2") as! [String]
//                let lang2Locale = list.value.valueForKey("lang2Locale") as! String //grab locale
//                
//                
//                
//                // these are word structures with locale info
//                var lang1Words : [Word] = []
//                var lang2Words : [Word] = []
//                
//                for word in lang1 {
//                    let newWord = Word.init(LangCode: lang1Locale, Text: word)
//                    lang1Words.append(newWord)
//                }
//                
//                for word in lang2 {
//                    let newWord = Word.init(LangCode: lang2Locale, Text: word)
//                    lang2Words.append(newWord)
//                }
//                
//                
//                
//                let newList  = List.init(name: listName, Lang1Words: lang1Words, Lang2Words: lang2Words)
//                //assemble the wordlist from the wordArrays
//                
//                listArray.append(newList)
//        
//                
//                
//            }
//            
//            
//        }
//        
//        
//         return listArray
//}
//        
//        
//        
//        
//
//}
//        
//    
//    
//    
//    
