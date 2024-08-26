//
//  SignUpViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 16/08/2024.
//

import UIKit

class SignUpViewController: BaseViewController {
    // MARK: - IBOUTLET @IBOutlet -
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
    /// text field container view
    @IBOutlet weak var fullnameView: CustomTextField!
    @IBOutlet weak var emailView: CustomTextField!
    @IBOutlet weak var phoneNumberView: CustomTextField!
    @IBOutlet weak var ccompNameView: CustomTextField!
    @IBOutlet weak var cityNameView: CustomTextField!
    @IBOutlet weak var addressView: CustomTextField!
    @IBOutlet weak var passwordView: CustomTextField!
    
    @IBOutlet weak var signUpBtn: UIButton!{
        didSet{
            signUpBtn.layer.cornerRadius = 8
            signUpBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var BacktowardLoginSC: UIButton!{
        didSet{
            let attributedString = NSAttributedString(string: "Login", attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue])
            BacktowardLoginSC.setAttributedTitle( attributedString, for: .normal)
        }
    }

    // MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateUI()
        
        
        
    }
    // MARK: - OVERRIDE FUNCTION -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK: - IBACTION @IBAction -
    
    @IBAction func backToLogInSC(_ sender: UIButton) {
        directToSingInScreen()
        
    }
    
    
    // MARK: - METHODS -
    
    private func updateUI(){
        /// Initialize CustomTextField with the outlet text field
        self.updateTextField(parentView: fullnameView, label: "Full Name", textField: userFullNameField, isPassword: false)
        self.updateTextField(parentView: emailView, label: "Email", textField: userEmailField, isPassword: false)
        self.updateTextField(parentView: phoneNumberView, label: "Phone Number", textField: phoneNumberTxtField, isPassword: false)
        self.updateTextField(parentView: ccompNameView, label: "Company Name", textField: conpNameTxtField, isPassword: false)
        self.updateTextField(parentView: cityNameView, label: "City", textField: cityNameTxtField, isPassword: false)
        self.updateTextField(parentView: addressView, label: "Address", textField: addressTxtField, isPassword: false)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTxtField, isPassword: true)
        addingshadow()
    }
    
    private func directToSingInScreen(){
        self.popBack()
    }
         
    private func addingshadow() {
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
    
}
