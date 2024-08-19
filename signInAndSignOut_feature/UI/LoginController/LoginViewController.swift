//
//  LoginViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 14/08/2024.
//

import UIKit


class LoginViewController: UIViewController {
    
    

    @IBOutlet weak var cardview: UIView!
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func forgetPasswordButton(_ sender: Any) {
    }
    @IBAction func createAccountButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARKS -Adding shadow to card-
        shadowadding()
        
        // MARKS -Adding the placeholder-
        placeholderadding()
        
        // MARKS -Adding the label text for password and user Name-
        addinglabel()
        
        // MARKS -Adding border to text field-
        addBorder()
        
        
        
        
    }
    
    func shadowadding() {
        cardview.layer.cornerRadius = 10
        cardview.layer.shadowColor = UIColor.black.cgColor
        cardview.layer.shadowOpacity = 0.5
        cardview.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardview.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }
    
    func placeholderadding(){
        userNameTextField.placeholder = "Type your Name"
        passwordTextField.placeholder = "Type your password"
        passwordTextField.isSecureTextEntry = true
        
    }
    
    func addinglabel(){
        let userLabel = UILabel()
        userLabel.text = "User Name"
        userLabel.font = UIFont.systemFont(ofSize: 15)
        cardview.addSubview(userLabel)
        userLabel.backgroundColor = UIColor.white
        userLabel.textAlignment = .center
        userLabel.layer.zPosition = 1
        
        
        // Constraints
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.centerYAnchor.constraint(equalTo: userView.topAnchor).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant: 32).isActive = true
        userLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
        
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
        
    }
    
    private func addBorder() {
        userView.layer.borderWidth = 1
        userView.layer.borderColor = UIColor.lightGray.cgColor
        userView.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
            userNameTextField.heightAnchor.constraint(equalToConstant: 35) // Adjust the height as needed
        ])
        passwordTextField.layer.masksToBounds = true // Ensures the content is clipped to the rounded corners
        
        
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        passwordView.layer.cornerRadius = 5
        passwordView.translatesAutoresizingMaskIntoConstraints = false // Ensure Auto Layout is used
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 35) // Adjust the height as needed
        ])
        
    }
    
    
    
}
