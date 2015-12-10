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
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        let password: String? = passwordField.text
        print(password)
    }
    
}