//
//  BaseViewController.swift
//  CustomTextField
//
//  Created by Mian Usama on 19/08/2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
    }

    //MARK: - Methods
    func updateTextField(parentView:CustomTextField, label: String, textField: UITextField, isPassword: Bool){
        /// Initialize CustomTextField with the outlet text field
        let customTextField = CustomTextField(labelName: label, textField: textField, isPassword: isPassword)
        
        parentView.addSubview(customTextField)
        /// Set constraints to ensure the custom text field fills the container
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        customTextField.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        customTextField.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        customTextField.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        customTextField.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
    }
}
