//
//  OnboardingCell.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 08.08.2023.
//

import UIKit


protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class OnboardingCell: UICollectionViewCell {
    private let onboardingImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    let message: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with onboardingModel: OnboardingModel) {
        onboardingImage.image = onboardingModel.image
        title.text = onboardingModel.title
        subtitle.text = onboardingModel.subtitle
        message.text = onboardingModel.message
    }
}
extension OnboardingCell {
    func setupViews() {
        addView(view: onboardingImage)
        addView(view: title)
        addView(view: subtitle)
        addView(view: message)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
        
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
           subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
           subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
           subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            onboardingImage.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: (self.frame.height * 1) / 5),
            onboardingImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingImage.heightAnchor.constraint(equalToConstant: self.frame.width / 2),
            
            message.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 25),
            message.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            message.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

        ])
        
    }
    func configureAppearance() {
        backgroundColor = .white
    }
}

extension OnboardingCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

