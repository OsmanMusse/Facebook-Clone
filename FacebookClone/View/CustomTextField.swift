//
//  CustomTextField.swift
//  FacebookClone
//
//  Created by Mezut on 20/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    // Text Rectangular space
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.inset(by: padding)
    }
    
    override func drawText(in rect: CGRect) {
        rect.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
