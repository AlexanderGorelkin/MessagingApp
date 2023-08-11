//
//  SignInView.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 07.08.2023.
//

import UIKit


protocol forgotpasswordDelegate: AnyObject {
    func showPassword()
}
protocol signupDelegate: AnyObject {
    func signUp()
}


final class SigninViewController: SuperViewController {
    
    
    
    private let signinTitle: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.shadowColor = .cyan
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = R.Colors.gray
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Here should be your username"
        textField.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .continue
        return textField
    }()
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = R.Colors.gray
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        
        return label
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Here should be your username"
        textField.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        textField.keyboardType = .default
        textField.returnKeyType = .continue
        return textField
    }()
    
    private let forgotView = ForgotStackView()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Login", for: .normal)
        
        button.layer.cornerRadius = 10
        button.backgroundColor = R.Colors.blue
        return button
    }()
    
    private let newuserView = NewUserStackView()
    
    
    private let newuserLabel: UILabel = {
        let label = UILabel()
        
        label.text = "New user"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        forgotView.delegate = self
        newuserView.delegate = self
        passwordTextField.resignFirstResponder()
        
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
extension SigninViewController {
    override func setupViews() {
        view.addView(view: signinTitle)
        view.addView(view: usernameLabel)
        view.addView(view: usernameTextField)
        view.addView(view: passwordLabel)
        view.addView(view: passwordTextField)
        view.addView(view: forgotView)
        view.addView(view: loginButton)
        view.addView(view: newuserView)
    }
    override func constraintViews() {
        NSLayoutConstraint.activate([
            
            signinTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            signinTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signinTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            
            usernameLabel.topAnchor.constraint(equalTo:signinTitle.bottomAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            forgotView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            forgotView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgotView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            loginButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            loginButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            loginButton.topAnchor.constraint(equalTo: forgotView.bottomAnchor, constant: 20.0),
            loginButton.heightAnchor.constraint(equalTo: loginButton.widthAnchor, multiplier: 1.0/7.0),
            
            newuserView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            newuserView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
extension SigninViewController: UITextFieldDelegate, forgotpasswordDelegate, signupDelegate {
    func signUp() {
        let alertSheet = UIAlertController(title: "Sorry", message: "Still not ready", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "(((", style: .default)
        alertSheet.addAction(alertAction)
        self.present(alertSheet, animated: true)
        
    }
    
    func showPassword() {
        let alert = UIAlertController(title: "Ur current password", message: "Dont forget about password in next time", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.underlined()
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.notUnderlined()
    }
    
}
