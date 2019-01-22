//
//  CustomTextField.swift
//  FacebookClone
//
//  Created by Mezut on 20/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    var padding: UIEdgeInsets?
    
    init(padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Text Rectangular space
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        guard let padding = padding else {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
       return bounds.inset(by: padding)
    }
    
    override func drawText(in rect: CGRect) {
        guard let padding = padding else {
           return ()
        }
        rect.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        guard let padding = padding else {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        guard let padding = padding else {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        return bounds.inset(by: padding)
    }

}

