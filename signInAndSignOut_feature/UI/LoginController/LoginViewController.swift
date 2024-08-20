//
//  LoginViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 14/08/2024.
//

import UIKit
import Foundation


class LoginViewController: BaseViewController {
    
    
    
    @IBOutlet weak var cardview: UIView!
    
    @IBOutlet weak var userView: CustomTextField!
    @IBOutlet weak var passwordView: CustomTextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passProtectimage: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        passwordTextField.isSecureTextEntry = true
        let cameraTap = UITapGestureRecognizer(target: self, action: #selector(cameraTapped))
        passProtectimage.isUserInteractionEnabled = true
        passProtectimage.addGestureRecognizer(cameraTap)
        
        updateUI()
        
        
    }
    
    
    private func updateUI(){
        self.updateTextField(parentView: userView, label: "Username", textField: userNameTextField)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTextField)
        shadowadding()
        

    }
    
    @objc func cameraTapped(){
        
        passwordTextField.isSecureTextEntry = !(passwordTextField.isSecureTextEntry)
        if passwordTextField.isSecureTextEntry
        {
            passProtectimage.image = UIImage(named: "password_protection")
        }
        else
        {
            passProtectimage.image = UIImage(named: "password_unprotected")
        }
        
    }
    
    private func shadowadding() {
        cardview.layer.cornerRadius = 10
        cardview.layer.shadowColor = UIColor.black.cgColor
        cardview.layer.shadowOpacity = 0.5
        cardview.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardview.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }
}
