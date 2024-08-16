//
//  LoginViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 14/08/2024.
//

import UIKit

class CustomTextField: UIView {
    private let textField: UITextField
    private let iconImageView: UIImageView
    private let label: UILabel
    
    init(labelText: String, icon: UIImage?, placeholder: String) {
        textField = UITextField()
        iconImageView = UIImageView(image: icon)
        label = UILabel()
        
        super.init(frame: .zero)
        
        setupLabel(text: labelText)
        setupIconImageView()
        setupTextField(placeholder: placeholder)
        layoutUI()
        //addBorder() // Adding the border
    }
    
    required init?(coder: NSCoder) {
        textField = UITextField()
        iconImageView = UIImageView()
        label = UILabel()
        
        super.init(coder: coder)
        
        setupLabel(text: "Label")
        setupIconImageView()
        setupTextField(placeholder: "")
        layoutUI()
        addBorder() // Adding the border
    }
    
    private func setupLabel(text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        addSubview(label)
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        addSubview(iconImageView)
    }
    
    private func setupTextField(placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        addSubview(textField)
    }
    
    private func layoutUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Label constraints
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            // Icon constraints
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            // Text field constraints
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 45),
            
            // Ensuring proper height for the entire view
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    // Adding a border to the CustomTextField view
    private func addBorder() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}


class LoginViewController: UIViewController {
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var cardview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardview.layer.cornerRadius = 10
        cardview.layer.shadowColor = UIColor.black.cgColor
        cardview.layer.shadowOpacity = 0.5
        cardview.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardview.layer.shadowRadius = 3
        cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
        
        let userNameField = CustomTextField(labelText: "User Name", icon: nil, placeholder: "Type your name")
        let passwordField = CustomTextField(labelText: "Password", icon: nil, placeholder: "Type your password")
        
        userView.addSubview(userNameField)
        passwordView.addSubview(passwordField)
        
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameField.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant: 4),
            userNameField.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -10),
            userNameField.centerYAnchor.constraint(equalTo: userView.centerYAnchor),
            userNameField.heightAnchor.constraint(equalToConstant: 70),
            
            passwordField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 4),
            passwordField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10),
            passwordField.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
