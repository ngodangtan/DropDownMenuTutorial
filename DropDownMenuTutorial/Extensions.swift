//
//  Extensions.swift
//  DropDownMenuTutorial
//
//  Created by Ngo Dang tan on 10/23/20.
//

import UIKit
extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func blue() -> UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237)
    }
    
    static func purple() -> UIColor {
        return UIColor.rgb(red: 98, green: 0, blue: 238)
    }
    
    static func pink() -> UIColor {
        return UIColor.rgb(red: 255, green: 148, blue: 194)
    }
    
    static func teal() -> UIColor {
        return UIColor.rgb(red: 3, green: 218, blue: 197)
    }
}

