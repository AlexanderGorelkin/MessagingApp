//
//  UITextFiled+Extensions.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 10.08.2023.
//

import UIKit

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = R.Colors.green.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    func notUnderlined() {
        self.layer.sublayers = nil
    }
}
