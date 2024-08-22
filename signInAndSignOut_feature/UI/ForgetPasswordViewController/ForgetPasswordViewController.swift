//
//  ForgetPasswordViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 22/08/2024.
//

import UIKit

class ForgetPasswordViewController: BaseViewController {
    
    //MARK: - IBAOutlet -
    @IBOutlet weak var parentViewEmail: CustomTextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var Submit: UIButton!{
        didSet{
            Submit.layer.cornerRadius = 8
            Submit.layer.masksToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        upDateUI()
    }
    
    // MARK: - Action -
    @IBAction func goToSignUpScBtn(){
        directToForgetpass()
    }
    
    // MARK: - Methods -
    private func upDateUI(){
        self.updateTextField(parentView: parentViewEmail, label: "Email", textField: emailTxtField, isPassword: false)
    }
    private func directToForgetpass(){                // - going to SignUp screen
        let vc = self.main.instantiateViewController(identifier: Identifiers.PASSWORD_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    

}
