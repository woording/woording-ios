//
//  loginViewController.swift
//  wording
//
//  Created by Justin on 12/10/15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListInspectorView : UIViewController {
    typealias List = (Lang1: [String], Lang2:  [String])

    
    
    enum mode {
        case display, picker, quiz
    } //create some modes for the inspector
    
    
    
    
    var currentMode : mode = mode.display
    //sets default mode to display
    

    var inspectorList : List = (["this"], ["this"])
   
    
    
    
    
    
    override func viewDidLoad() {
       
        switch currentMode {
        case mode.display :
            print("display")
        case mode.picker :
            print("picker")
        case mode.quiz :
            print("picker")
      
        }
        
    }
    
    
    
}