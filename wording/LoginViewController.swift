//
//  loginViewController.swift
//  wording
//
//  Created by Justin on 12/10/15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController : UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var username : String?
    var password : String?
    
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
         username  = usernameField.text
         password  = passwordField.text
        
        print(password)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! MainViewController
        
        
        if segue.identifier != nil { //check if there is an ID for the seg
            
        switch segue.identifier!{ //if there is an ID switch against these values
        case "Login" :
            print("this")
            
            controller.name = username!
            
            
            
            
        case "that" : //never going to happen
            print("that")
        default :    //this either.
            print("what")
        }
        }
    }

    
    
    
    
}