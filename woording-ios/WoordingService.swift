//
//  WoordingService.swift
//  woording-ios
//
//  Created by Cor Pruijs on 29-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import Alamofire

func addListsToRealm() {
    Alamofire.request(.POST, "http://api.woording.com/authenticate",
        parameters: ["username": "cor", "password": "Hunter2"],
        encoding: .JSON,
        headers: ["Content-Type": "application/json;charset=UTF-8"]).responseJSON {
            
        response in print(response)
            
    }
}