//
//  SignUpViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 16/08/2024.
//

import UIKit

class SignUpViewController: BaseViewController {
    /// main card
    @IBOutlet weak var cardViewContainer: UIView!
    @IBOutlet weak var cardContainer: UIView!
    /// text fields
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userFullNameField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var conpNameTxtField: UITextField!
    @IBOutlet weak var cityNameTxtField: UITextField!
    @IBOutlet weak var addressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    /// text field container
    @IBOutlet weak var fullnameView: CustomTextField!
    @IBOutlet weak var emailView: CustomTextField!
    @IBOutlet weak var phoneNumberView: CustomTextField!
    @IBOutlet weak var ccompNameView: CustomTextField!
    @IBOutlet weak var cityNameView: CustomTextField!
    @IBOutlet weak var addressView: CustomTextField!
    @IBOutlet weak var passwordView: CustomTextField!
    
    
    @IBOutlet weak var backtoLogin: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributedString = NSAttributedString(string: "Login", attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ])
            
            // Assign the attributed string to the label
            backtoLogin.attributedText = attributedString
        addingshadow()
       updateUI()
        
        
        
    }
    
    
    // MARKS -adding shadow to the card container-
    func addingshadow() {
        
        cardViewContainer.layer.cornerRadius = 10
        cardViewContainer.layer.shadowColor = UIColor.black.cgColor
        cardViewContainer.layer.shadowOpacity = 0.5
        cardViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardViewContainer.layer.shadowRadius = 3
        
        
        
        
        
        
        cardContainer.layer.cornerRadius = 10
        cardContainer.layer.shadowColor = UIColor.black.cgColor
        cardContainer.layer.shadowOpacity = 0.5
        cardContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardContainer.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }
    private func updateUI(){
        /// Initialize CustomTextField with the outlet text field
        
        self.updateTextField(parentView: fullnameView, label: "Full Name", textField: userFullNameField)
        self.updateTextField(parentView: emailView, label: "Email", textField: userEmailField)
        self.updateTextField(parentView: phoneNumberView, label: "Phone Number", textField: phoneNumberTxtField)
        self.updateTextField(parentView: ccompNameView, label: "Company Name", textField: conpNameTxtField)
        self.updateTextField(parentView: cityNameView, label: "City", textField: cityNameTxtField)
        self.updateTextField(parentView: addressView, label: "Address", textField: addressTxtField)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTxtField)
        
    }
         
    
}
