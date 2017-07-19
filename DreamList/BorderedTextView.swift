//
//  BorderedTextView.swift
//  DreamList
//
//  Created by Andre Rosa on 18/07/17.
//  Copyright © 2017 Andre Rosa. All rights reserved.
//

import UIKit

private var borderedViewKey = false

@IBDesignable extension UIView {

    @IBInspectable var borderedView: Bool{
        get{
            return borderedViewKey
        }
        set{
            borderedViewKey = newValue
            
            if borderedViewKey{
                self.layer.borderWidth = 1
                self.layer.borderColor = UIColor(red:0.79, green:0.79, blue:0.81, alpha:0.7).cgColor
                self.layer.cornerRadius = 5
            } else {
                self.layer.borderWidth = 0
                self.layer.borderColor = UIColor(red:0.79, green:0.79, blue:0.81, alpha: 0.0).cgColor
                self.layer.cornerRadius = 0
            }
         
        }
    }

}
