//
//  CustomTextField.swift
//  signInAndSignOut_feature
//
//  Created by SID on 20/08/2024.
//

import Foundation
import UIKit

// MARK: - add pading to the label just call this function/class
/*
 if you want to padding to label anywhere in project just create object of paddedLabel class and you're
 good to go -add the label to addView if you have not | -add constraint according where you use your label
 */
class PaddedLabel: UILabel { // subclass of UILabel
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width + 20, height: super.intrinsicContentSize.height)
    }
}

// MARK: - add custom text to text field just call this classs



class CustomTextField: UIView {
    
    private let label: UILabel // label that shows over the border of field
    private var textField: UITextField! // Text field
    
    init(labelName: String, textField: UITextField) { // Initionalization function
        
        
        
        self.label = PaddedLabel() // adding padding to the label
        super.init(frame: .zero)
        self.textField = textField // self.textField means class variable
        // removing exiting border that applied by system on text field
        self.textField.borderStyle = .none
        self.textField.backgroundColor = .clear
        
        
        // Container view to hold the text field
        let containerView = UIView() // creating container of UIView class, just like drag and drop UIView inside the storyboard
        // added border to the caintainer (in your case its userView)
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        // adding this as sub view
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false // removing exiting constraints so we can customized according to our needs
        // adding constaints container
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        
        // adding text field inside the container that we created above
        containerView.addSubview(self.textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false // removing exiting constraints so we can customized according to our needs
        // adding constaints
        self.textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        
        
        // Adding label to the text field
        self.label.text = labelName
        self.label.font = UIFont.systemFont(ofSize: 14)
        self.label.textColor = .black
        self.label.backgroundColor = .white
        self.label.textAlignment = .center
        self.label.layer.zPosition = 1 // Ensures the label appears above the border
        // adding constaints
        addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerYAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        self.label.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    // This required initializer is a boilerplate code that triggers a runtime error if the class is initialized from a storyboard or nib.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

