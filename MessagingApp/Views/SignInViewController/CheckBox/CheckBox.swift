//
//  CheckBox.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 09.08.2023.
//
import UIKit


final class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(systemName: "checkmark.square")
    let uncheckedImage = UIImage(systemName: "square")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(checked(sender: )), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func checked(sender: UIButton) {
        isChecked = !isChecked
    }
    
    
}
    
