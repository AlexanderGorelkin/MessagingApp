//
//  NewUserStackView.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 11.08.2023.
//

import UIKit


final class NewUserStackView: BaseView {
    
    weak var delegate: signupDelegate?
    
    private let newUserLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.text = "New User?"
        return label
    }()
    private let signupButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        
        
        
        configuration.attributedTitle = AttributedString("Sign Up", attributes: AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor: R.Colors.blue]))
        
        configuration.baseBackgroundColor = .white
        
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(signUp(sender: )), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    private let newuserStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension NewUserStackView {
    override func setupViews() {
        addView(view: newuserStackView)
        newuserStackView.addArrangedSubview(newUserLabel)
        newuserStackView.addArrangedSubview(signupButton)
    }
    override func constraintViews() {
        
        NSLayoutConstraint.activate([
            
            newuserStackView.topAnchor.constraint(equalTo: topAnchor),
            newuserStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newuserStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newuserStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        
    }
}


@objc extension NewUserStackView {
    func signUp(sender: UIButton) {
        self.delegate?.signUp()
    }
}
