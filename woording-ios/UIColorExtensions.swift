//
//  UIColorExtensions.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    class func WordingColor() -> UIColor {
        return UIColor(hex: 0x4CAF50)
    }
    
    class func WordingColorDark() -> UIColor {
        return UIColor(hex: 0x388E3C)
    }
    
    class func WordingColorLight() -> UIColor {
        return UIColor(hex: 0xC8E6C9)
    }
    
    class func WordingAccentColor() -> UIColor {
        return UIColor(hex: 0xFF9800)
        
    }
}
