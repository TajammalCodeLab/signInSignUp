//
//  DashboardViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 21/08/2024.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    // MARK: - IBOUTLETS @IBOutlet -
    @IBOutlet weak var receivedUserNameLabel: UILabel!
    @IBOutlet weak var receivedPasswordLabel: UILabel!
    
    // MARK: - VARIABLES  -
    var receivedUserName: String? = ""
    var receivedPassword: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //unwrappingTXT()
        datafromDefualts()
    }
    
    
    
    // MARK: - OVERRIDE FUNCTION -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - IBActions -
    @IBAction func authUser(_ sender: UIButton) {
        directToLoginSC()
    }
    
    @IBAction func directToPackages(_ sender: Any) {
        directToPackages()
    }
    
    // MARK: - METHODS -
    
    private func unwrappingTXT(){
        if let userName = receivedUserName, let password = receivedPassword {
            receivedUserNameLabel.text = userName
            receivedPasswordLabel.text = password
        }
    }
    private func datafromDefualts(){
        receivedUserNameLabel.text = UserDefaults.standard.string(forKey: "email")
        receivedPasswordLabel.text = UserDefaults.standard.string(forKey: "password")
    }
    private func directToLoginSC(){
        UserDefaults.standard.set(false, forKey: "IsLogin")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        
        //let vc = self.main.instantiateViewController(identifier: Identifiers.LAUNCH_ID)
        self.navigationController?.popToRootViewController(animated: true)
    }
    private func directToPackages(){
        let vc = self.main.instantiateViewController(identifier: Identifiers.PACKAGESC_ID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
/*

// MARK: - Extention -
extension DashboardViewController: DataSendingProtocol{
    func sendDataToDashboard(userName: String, password: String) {
        receivedUserName = userName
        receivedPassword = password
    }
    
    
    
}*/
