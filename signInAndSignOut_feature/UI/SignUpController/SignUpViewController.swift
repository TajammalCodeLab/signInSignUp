//
//  SignUpViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 16/08/2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var cardViewContainer: UIView!
    
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userFullNameField: UITextField!
    
    @IBOutlet weak var fullnameView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingshadow()
        
        placeholderadding()
        
        addinglabel()
        
        
        
    }
    
    
    // MARKS -adding shadow to the card container-
    func addingshadow() {
        
        cardViewContainer.layer.cornerRadius = 10
        cardViewContainer.layer.shadowColor = UIColor.black.cgColor
        cardViewContainer.layer.shadowOpacity = 0.5
        cardViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardViewContainer.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }
    func placeholderadding(){
        userFullNameField.placeholder = "Type your Full Name"
        userFullNameField.placeholder = "Type your Email"
        //passwordTextField.isSecureTextEntry = true
        
    }
    
    
    
    
    func addinglabel(){
        let userLabel = UILabel()
        userLabel.text = "User Name"
        userLabel.font = UIFont.systemFont(ofSize: 15)
        cardViewContainer.addSubview(userLabel)
        userLabel.backgroundColor = UIColor.white
        userLabel.textAlignment = .center
        userLabel.layer.zPosition = 1
        
        
        // Constraints
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.centerYAnchor.constraint(equalTo: fullnameView.topAnchor).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: fullnameView.leadingAnchor, constant: 32).isActive = true
        userLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
        /*
        // Add a label to the password view
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 15)
        passwordLabel.backgroundColor = UIColor.white
        passwordLabel.textAlignment = .center
        cardview.addSubview(passwordLabel)
        passwordLabel.layer.zPosition = 1
        
        // constraints
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.centerYAnchor.constraint(equalTo: passwordView.topAnchor).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 33).isActive = true
        passwordLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
         */
    }
         
    
}
