//
//  DashboardViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 21/08/2024.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: - IBOUTLETS @IBOutlet -
    @IBOutlet weak var receivedUserNameLabel: UILabel!
    @IBOutlet weak var receivedPasswordLabel: UILabel!
    
    // MARK: - VARIABLES  -
    var receivedUserName: String? = ""
    var receivedPassword: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unwrappingTXT()
    }
    
    
    // MARK: - OVERRIDE FUNCTION -
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - METHODS -
    func sendDataToDashboardw(userName: String, password: String) {
        receivedUserName = userName
        receivedPassword = password
    }
    private func unwrappingTXT(){
        if let userName = receivedUserName, let password = receivedPassword {
            receivedUserNameLabel.text = userName
            receivedPasswordLabel.text = password
        }
    }
    
    
}

// MARK: - Extention -
extension DashboardViewController: DataSendingProtocol{
    func sendDataToDashboard(userName: String, password: String) {
        receivedUserName = userName
        receivedPassword = password
    }
    
    
    
}
