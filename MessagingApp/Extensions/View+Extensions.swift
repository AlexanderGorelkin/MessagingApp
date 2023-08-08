//
//  View+Extensions.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 08.08.2023.
//

import UIKit

extension UIView {
    func addView(view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
