//
//  OnboardStackView.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 08.08.2023.
//

import UIKit


final class OnboardingStackView: BaseView {
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    private let skipButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .white
        configuration.attributedTitle = AttributedString("SKIP", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(red: 179/255.0, green: 186/255.0, blue: 202/255.0, alpha: 1.0),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .heavy)]))
        let button = UIButton(configuration: configuration)
        return button
    }()
    
    private let nextButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .white
        configuration.attributedTitle = AttributedString("NEXT", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(red: 108/255.0, green: 99/255.0, blue: 255/255.0, alpha: 1.0),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .heavy)]))
        let button = UIButton(configuration: configuration)
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
extension OnboardingStackView {
    override func setupViews() {
        addView(view: stackView)
        stackView.addArrangedSubview(skipButton)
        stackView.addArrangedSubview(nextButton)
        
        
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
