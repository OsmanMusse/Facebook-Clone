//
//  LoginScreen.swift
//  FacebookClone
//
//  Created by Mezut on 20/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit



class LoginScreen: UIViewController {
    
    
    let profileImage: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "Profile-image"))
       image.contentMode = .scaleAspectFit
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    let notificationCircle: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(r: 224, g: 12, b: 12, a: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notificationNumber: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = .white
        label.font = UIFont(name: "Roboto-Bold", size: 18)
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let userNameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Tani Modevian"
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "**********"
        textField.tintColor = .red
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = Colors.mainBgColor
        
        view.addSubview(facebookLogo)
        view.addSubview(profileImage)
        
        view.addSubview(notificationCircle)
        view.addSubview(notificationNumber)
        
        notificationCircle.addSubview(notificationNumber)
        
        let guide = view.safeAreaLayoutGuide
        
        setupTextFields()
        
        // Autolayout positioning elements
        
        NSLayoutConstraint.activate([
            facebookLogo.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
            facebookLogo.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 0),
            
            profileImage.topAnchor.constraint(equalTo: facebookLogo.bottomAnchor, constant: 40),
            profileImage.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 170),
            
            
            notificationCircle.widthAnchor.constraint(equalToConstant: 48),
            notificationCircle.heightAnchor.constraint(equalToConstant: 48),
            notificationCircle.topAnchor.constraint(equalTo: profileImage.topAnchor),
            notificationCircle.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            
            notificationNumber.centerXAnchor.constraint(equalTo: notificationCircle.centerXAnchor),
            notificationNumber.centerYAnchor.constraint(equalTo: notificationCircle.centerYAnchor)
            ])
        
        
        
    }
    
    func setupTextFields(){
        let guide = view.safeAreaLayoutGuide
        let arrangedSubviews: [UITextField] = [userNameTextField, passwordTextField]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 35).isActive = true
        stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        
        
   
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    



}
