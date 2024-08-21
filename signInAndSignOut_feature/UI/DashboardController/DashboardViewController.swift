//
//  DashboardViewController.swift
//  signInAndSignOut_feature
//
//  Created by SID on 21/08/2024.
//

import UIKit

class DashboardViewController: UIViewController, MyDataSendingDelegateProtocol {

    @IBOutlet weak var receivedUserNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func sendDataToFirstViewController(myData: String) {
        self.receivedUserNameLabel.text = "\(myData)"
        }
    

}
