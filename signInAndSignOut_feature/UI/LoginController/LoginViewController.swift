//
//  LoginViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 14/08/2024.
//

import UIKit
import Foundation


protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(myData: String)
}


class LoginViewController: BaseViewController {
    
    
    @IBOutlet weak var cardview: UIView!
    
    @IBOutlet weak var userView: CustomTextField!
    @IBOutlet weak var passwordView: CustomTextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var passProtectimage: UIImageView!{
        didSet{
            passProtectimage.isUserInteractionEnabled = true
            let eyeProtection = UITapGestureRecognizer(target: self, action: #selector(cameraTapped))
            passProtectimage.addGestureRecognizer(eyeProtection)
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        updateUI()
        
        
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = userNameTextField.text, Utils.isValidEmail(email) else {
            // Show an alert or message to the user that the email is invalid
            if userNameTextField.text == "" {
                Utils.showAlert("Invalid Email", "Email is Empty", vc: self)
            }
            else {
                Utils.showAlert("Invalid Email", "Please enter a valid email address.", vc: self)
            }
            
            return
        }
        
        guard let password = passwordTextField.text, Utils.isValidPassword(password) else {
            // Show an alert or message to the user that the password is invalid
            if passwordTextField.text == "" {
                Utils.showAlert("Invalid Password", "Password is Empty", vc: self)
            }
            else {
                Utils.showAlert("Invalid Password", "Password must be at least 8 characters long, contain at least one uppercase letter and one number.", vc: self)
            }
            
            return
        }
        
    }
    
    
    
    // MARK: - UI builder
    private func updateUI(){
        self.updateTextField(parentView: userView, label: "Username", textField: userNameTextField, isPassword: false)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTextField, isPassword: true)
        shadowadding()
        
        
    }
    
    // MARK: - Animation/transision
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - password protection tapping function
    @objc func cameraTapped(){
        print("tapped")
        passwordTextField.isSecureTextEntry = !(passwordTextField.isSecureTextEntry)
        
        if passwordTextField.isSecureTextEntry{
            passProtectimage.image = UIImage(named: "password_protection")
        }else{
            passProtectimage.image = UIImage(named: "password_unprotected")
        }
    }
    
    // MARK: - Shadow Function adding shadow to container
    
    private func shadowadding() {
        cardview.layer.cornerRadius = 10
        cardview.layer.shadowColor = UIColor.black.cgColor
        cardview.layer.shadowOpacity = 0.5
        cardview.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardview.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }
    
    
    
    
    
}
