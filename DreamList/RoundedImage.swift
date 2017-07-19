//
//  RoundedImage.swift
//  DreamList
//
//  Created by Andre Rosa on 18/07/17.
//  Copyright © 2017 Andre Rosa. All rights reserved.
//

import UIKit

private var roudedImageKey = false

@IBDesignable extension UIImageView {

    @IBInspectable var roudedImage: Bool{
        get{
            return roudedImageKey
        }
        set{
            roudedImageKey = newValue
            
            if roudedImageKey{
                self.layer.masksToBounds = true
                self.layer.cornerRadius = self.frame.size.width/2
            } else {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 0
            }
            
        }
    }

}
