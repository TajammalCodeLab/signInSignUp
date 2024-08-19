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
        
    }
    
    func addinglabel(){
        let userLabel = UILabel(frame: CGRect(x: 30, y: -10, width: 70, height: 20))
        userLabel.text = "User Name"
        userLabel.font = UIFont.systemFont(ofSize: 12)
        userView.addSubview(userLabel)
        
        // Add a label to the password view
        let passwordLabel = UILabel(frame: CGRect(x: 30, y: -10, width: 70, height: 20))
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 12)
        passwordView.addSubview(passwordLabel)
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
