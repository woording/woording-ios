//
//  WoordingService.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class WoordingService {
    static let realm = try! Realm()
    
    static let apiIP = "http://api.woording.com/"
    static let authParameters = ["username": "cor", "password": "Hunter2"]
    static let headers = ["Content-Type": "application/json;charset=UTF-8"]
    
    
    // Function that returns an authorization token
    class func getToken(onCompletion: (token: String) -> ()) {
        Alamofire.request(.POST, apiIP + "authenticate", parameters: authParameters, encoding: .JSON, headers: headers).responseJSON {
            
            response in switch response.result {
            case .Success(let JSON):
                
                let response = JSON as! NSDictionary
                let token = response.objectForKey("token")! as! String
                
                onCompletion(token: token)
                
            case .Failure(let error):
                print("Error retrieving token: \(error)")
            }
        }
        
    }
    
    class func addListsToRealm() {
        
        // Get a token for authentication
        self.getToken() {
            
            token in
            
            Alamofire.request(.POST, apiIP + "cor/test1", parameters: ["token": token], encoding: .JSON, headers: headers).responseJSON {
                response in switch response.result {
                    
                case .Success(let JSON):
                    
                    // extract data from response
                    let response = JSON as! NSDictionary
                    let listname = response.objectForKey("listname") as! String
                    let language1Code = response.objectForKey("language_1_tag") as! String
                    let language2Code = response.objectForKey("language_2_tag") as! String
                    let translations = response.objectForKey("words") as! NSArray
                    
                    // Create a realm object from the retrieved data
                    let list = TranslationList(name: listname, language1Code: language1Code, language2Code: language2Code)
                    
                    // Iterate over the retrieved translations
                    for translation in translations {
                        
                        // extract data from the retrieved translations
                        let language1Text = translation.objectForKey("language_1_text") as! String
                        let language2Text = translation.objectForKey("language_2_text") as! String
                        
                        // create a new realm compatible Translation object
                        let translation = Translation(language1Text: language1Text, language2Text: language2Text)
                        
                        // Append the translation to the TranslationList
                        list.translations.append(translation)
                    }
                    
                    // Add the list to the realm
                    try! realm.write {
                        realm.add(list)
                    }
                    
                case .Failure(let error):
                    print("Error retrieving lists: \(error)")
                    
                    
                }
                
            }
            
        }
       
    }
    
}

