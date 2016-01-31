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
    
    static let apiAddress = "http://api.woording.com/"
    static let authenticationParameters = ["username": "cor", "password": "Hunter2"]
    static let headers = ["Content-Type": "application/json;charset=UTF-8"]
    
    static var cachedToken: String?
    
    // Function that returns an authorization token
    class func getToken(onCompletion: (token: String) -> ()) {
        
        // Check if there's a cached token available, and if so, use that one
        if let token = cachedToken {
            onCompletion(token: token)
            
        // There isn't a cached Token avialable, request a new one
        } else {
            
            // Setup the request
            Alamofire.request(.POST,
                apiAddress + "authenticate",
                parameters: authenticationParameters,
                encoding: .JSON,
                headers: headers).responseJSON {
                
                response in switch response.result {
                    
                case .Success(let JSON):
                    
                    // Convert the JSON response to a NSDictionary
                    let response = JSON as! NSDictionary
                    
                    // Extract the token from the retrieved dictionary
                    let token = response.objectForKey("token")! as! String
                    
                    // Handle the onCompletion block and pass the token to it
                    onCompletion(token: token)
                    
                // Request failed
                case .Failure(let error):
                    print("Error retrieving token: \(error)")
                }
            }
            
        }
        
    }
    
    
    // MARK: - Primary fetch and add to realm methods
    class func fetchUser(username: String, onCompletion: () -> ()) {
        self.getToken {
            
            token in
            // Setup the request
            Alamofire.request(.POST,
                apiAddress + username,
                parameters: ["token": token],
                encoding: .JSON,
                headers: headers).responseJSON {
                
                response in switch response.result {
                    
                case .Success(let JSON):
                    
                    // Convert the response JSON to a NSDictionary
                    let response = JSON as! NSDictionary
                    
                    let name = response.objectForKey("username") as! String
                    let email = response.objectForKey("email") as! String
                    let translationListIdentifiers = response.objectForKey("lists") as! NSArray
                    
                    let user = User(name: name, email: email)
                    
                    for translationListIdentifier in translationListIdentifiers {
                        
                        let name = translationListIdentifier.objectForKey("listname") as! String
                        let language1Code = translationListIdentifier.objectForKey("language_1_tag") as! String
                        let language2Code = translationListIdentifier.objectForKey("language_2_tag") as! String
                        
                        let listIdentifier = TranslationListIdentifier(name: name, language1Code: language1Code, language2Code: language2Code)
                        
                        user.translationListIdentifiers.append(listIdentifier)
                    }
                    
                    try! realm.write {
                        realm.add(user)
                    }
                    onCompletion()
                    
                // Request failed
                case .Failure(let error):
                    print("Error fetching user: \(error)")
                    
                }
            }
        }
    }
    
    
    class func fetchList(username: String, listname: String) {
        // Get a token for authentication
        self.getToken() {
            
            // Use the retrieved token in a block
            token in
            
            // Setup the request
            Alamofire.request(.POST,
                apiAddress + username + "/" + listname,
                parameters: ["token": token],
                encoding: .JSON,
                headers: headers).responseJSON {
                
                response in switch response.result {
                    
                case .Success(let JSON):
                    
                    // Convert the response JSON to a NSDictionary
                    let response = JSON as! NSDictionary
                    
                    // Extract data from response dictionary
                    let listname = response.objectForKey("listname") as! String
                    let language1Code = response.objectForKey("language_1_tag") as! String
                    let language2Code = response.objectForKey("language_2_tag") as! String
                    let translations = response.objectForKey("words") as! NSArray
                    
                    // Create a Realm-compatible TranslationList from the retrieved data
                    let list = TranslationList(name: listname, language1Code: language1Code, language2Code: language2Code)
                    
                    // Iterate over the retrieved Translations and add them to the TranslationList
                    for translation in translations {
                        
                        // Extract data from the retrieved translations
                        let language1Text = translation.objectForKey("language_1_text") as! String
                        let language2Text = translation.objectForKey("language_2_text") as! String
                        
                        // Create a new realm compatible Translation object
                        let translation = Translation(language1Text: language1Text, language2Text: language2Text)
                        
                        // Append the translation to the TranslationList
                        list.translations.append(translation)
                    }
                    
                    // Add the new TranslationList to the realm
                    try! realm.write {
                        realm.add(list)
                    }
                    
                // Request failed
                case .Failure(let error):
                    print("Error retrieving lists: \(error)")
                    
                }
                
            }
            
        }
        
    }
    
    // MARK: - Convenience fetch and add to Realm methods
    
    // TODO: Fix unsafeness of this method
    class func fetchListsForUser(username: String) {
        
        // get the user by username
        if let user = realm.objects(User).filter("name = '\(username)'").first {
            
            // iterate over the user's translationListIdentifiers
            for translationListIdentifier in user.translationListIdentifiers {
                
                // fetch a translationList based on the translationListIdentifier's name
                fetchList(user.name, listname: translationListIdentifier.name)
            }
        } else {
            print("Error, no such user (inside fetchListsForUser)")
        }
        
    }
    
}

