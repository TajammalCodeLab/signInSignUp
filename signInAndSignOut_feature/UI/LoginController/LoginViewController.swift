//
//  LoginViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 14/08/2024.
//

import UIKit
import Foundation

class LoginViewController: BaseViewController {
    
    // MARK: - OUTLETS @IBOutlet -
    @IBOutlet weak var loginButtonOutlet: UIButton!{
        didSet{
            loginButtonOutlet.layer.cornerRadius = 8
            loginButtonOutlet.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var towardForgetBtn: UIButton!{
        didSet{
            btnUnderline(btn: towardForgetBtn,btnTxt: "Forget password?")
        }
    }
    @IBOutlet weak var towardSignUpBtn: UIButton!{
        didSet{
            btnUnderline(btn: towardSignUpBtn, btnTxt: "Sign Up")
        }
    }
    
    
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
    // MARK: - VARIABLES CONSTANTS -
    
    
    
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    // MARK: - OVERRIDE FUNCTIONS -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - IBACTION @IBAction -
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = userNameTextField.text, Utils.isValidEmail(email) else {
            if userNameTextField.text == "" {
                Utils.showAlert("Invalid Email", "Email is Empty", vc: self)
            } else {
                Utils.showAlert("Invalid Email", "Please enter a valid email address.", vc: self)
            }
            return
        }
        
        guard let password = passwordTextField.text, Utils.isValidPassword(password) else {
            if passwordTextField.text == "" {
                Utils.showAlert("Invalid Password", "Password is Empty", vc: self)
            } else {
                Utils.showAlert("Invalid Password", "Password must be at least 8 characters long, contain at least one uppercase letter and one number.", vc: self)
            }
            return 
        }
        directToDashboardScreen()
        
    }
    @IBAction func goToSignUpScBtn(){
        directToSignUpScreen()
    }
    @IBAction func goToForgetScBtn(){
        directToForgetScreen()
    }
    
    
    
    // MARK: - METHODS -
    
    private func updateUI(){
        self.updateTextField(parentView: userView, label: "Username", textField: userNameTextField, isPassword: false)
        self.updateTextField(parentView: passwordView, label: "Password", textField: passwordTextField, isPassword: true)
        shadowadding()
    }
    
    private func shadowadding() {
        cardview.layer.cornerRadius = 10
        cardview.layer.shadowColor = UIColor.black.cgColor
        cardview.layer.shadowOpacity = 0.5
        cardview.layer.shadowOffset = CGSize(width: 0, height: 1)
        cardview.layer.shadowRadius = 3
        //cardview.layer.shadowPath = UIBezierPath(roundedRect: cardview.bounds, cornerRadius: cardview.layer.cornerRadius).cgPath
    }

    private func directToSignUpScreen(){                // - going to SignUp screen
        let vc = self.main.instantiateViewController(identifier: Identifiers.SIGNUP_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func directToDashboardScreen() {
        if let dashboardVC = self.main.instantiateViewController(identifier: Identifiers.DASHBOARD_ID) as? DashboardViewController {
            dashboardVC.sendDataToDashboard(userName: userNameTextField.text ?? "Nothing", password: passwordTextField.text ?? "Nothing")
            self.navigationController?.pushViewController(dashboardVC, animated: true)
        }
    }
    private func directToForgetScreen(){
        let vc = self.main.instantiateViewController(identifier: Identifiers.PASSWORD_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private func btnUnderline(btn: UIButton, btnTxt: String){
        let attributedString = NSAttributedString(string: btnTxt, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue])
        btn.setAttributedTitle( attributedString, for: .normal)
    }
    
    
    
    // MARK: - OBJECT C @obj -
    @objc func cameraTapped(){
        print("tapped")
        passwordTextField.isSecureTextEntry = !(passwordTextField.isSecureTextEntry)
        
        if passwordTextField.isSecureTextEntry{
            passProtectimage.image = UIImage(named: "password_protection")
        } else {
            passProtectimage.image = UIImage(named: "password_unprotected")
        }
    }
    
    
    
    
    

    
    
    
    
    
}
