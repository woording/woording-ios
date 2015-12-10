//
//  ViewController.swift
//  wording
//
//  Created by Cor Pruijs on 22-09-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wordingService = WordingService()
        
        wordingService.getUser("cor") {
            json in
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

