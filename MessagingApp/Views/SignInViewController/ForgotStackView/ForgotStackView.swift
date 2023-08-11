//
//  ForgotStackView.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 08.08.2023.
//

import UIKit




final class ForgotStackView: BaseView {
    
   
    weak var delegate: forgotpasswordDelegate?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    
    private let remembermeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    private let checkBox = CheckBox(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    private let remembermeLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.text = "Remember me"
        return label
    }()
    
    private let forgotPasswordButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        
        configuration.attributedTitle = AttributedString("Forgot password?", attributes: AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor: R.Colors.blue]))
        
        configuration.baseBackgroundColor = .white
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        return button
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
extension ForgotStackView {
    override func setupViews() {
        addView(view: remembermeStackView)
        remembermeStackView.addArrangedSubview(checkBox)
        remembermeStackView.addArrangedSubview(remembermeLabel)
        addView(view: stackView)
        stackView.addArrangedSubview(remembermeStackView)
        stackView.addArrangedSubview(forgotPasswordButton)
        
    }
    override func constraintViews() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        
    }
    override func configureAppearance() {
        
    }
}
@objc extension ForgotStackView {
    func showPassword() {
        print("Hello")
        self.delegate?.showPassword()
    }
}
