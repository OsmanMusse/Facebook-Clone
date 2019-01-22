//
//  LoginScreen.swift
//  FacebookClone
//
//  Created by Mezut on 20/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit


class LoginScreen: UIViewController {
    
    let facebookLogo: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Facebook-logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
        label.font = UIFont(name: "Roboto-Bold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let userNameTextField: CustomTextField = {
        let padding = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        let textField = CustomTextField(padding: padding)
        textField.attributedPlaceholder = NSAttributedString(string: "Tani Modevian", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 17)])
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let padding = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        let textField = CustomTextField(padding: padding)
        textField.attributedPlaceholder = NSMutableAttributedString(string: "**********", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textColor = .white
        textField.tintColor = .white
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let userIconView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 28.5
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(r: 49, g: 77, b: 139, a: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userIconImage: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "User-icon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let passwordIconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28.5
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(r: 49, g: 77, b: 139, a: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordIconImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Password-lock"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let loginBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Zaloguj", for: .normal)
        button.setTitleColor(UIColor(r: 25, g: 49, b: 141, a: 100), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    
    let infoLabel: UIButton = {
         NSAttributedString.Key.underlineStyle
       let button = UIButton(type: .system)
        let attributedText =  NSMutableAttributedString(string: "Nie masz konta?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 16)])
        let underlineText = NSAttributedString(string: " Zarejestruj sie", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 16), NSAttributedString.Key.underlineStyle: 1])
        attributedText.append(underlineText)
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(goToHomeController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    
    let extraInformation: UILabel = {
        let label = UILabel()
        label.text = "Zaloguj sie na inne Knonto"
        label.textColor = UIColor(r: 84, g: 112, b: 168, a: 100)
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let copyRightText: UILabel = {
      let label = UILabel()
      let attributedText = NSMutableAttributedString(string: "Copyright 2019 by Facebook", attributes: [NSAttributedString.Key.foregroundColor: Colors.grayTransparent, NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 12)])
      attributedText.append(NSAttributedString(string: "  Facebook", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 12)]))
      label.attributedText = attributedText
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = Colors.mainBgColor
        
        view.addSubview(facebookLogo)
        view.addSubview(profileImage)
        
        view.addSubview(notificationCircle)
        view.addSubview(notificationNumber)
        
        notificationCircle.addSubview(notificationNumber)
        
        setupTextFields()
       
        let guide = view.safeAreaLayoutGuide
        
    
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
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        view.addSubview(userIconView)
        view.addSubview(userIconImage)
        
        view.addSubview(passwordIconView)
        view.addSubview(passwordIconImage)
        
        userIconView.addSubview(userIconImage)
        
        passwordIconView.addSubview(passwordIconImage)
        
        view.addSubview(loginBtn)
        view.addSubview(infoLabel)
        view.addSubview(extraInformation)
        view.addSubview(copyRightText)
        
        stackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 35).isActive = true
        stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        userIconView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        userIconView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        userIconView.widthAnchor.constraint(equalToConstant: 57).isActive = true
        userIconView.heightAnchor.constraint(equalToConstant: 57).isActive = true

        userIconImage.centerXAnchor.constraint(equalTo: userIconView.centerXAnchor).isActive = true
        userIconImage.centerYAnchor.constraint(equalTo: userIconView.centerYAnchor).isActive = true
        
        passwordIconView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        passwordIconView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        passwordIconView.widthAnchor.constraint(equalToConstant: 57).isActive = true
        passwordIconView.heightAnchor.constraint(equalToConstant: 57).isActive = true
        
        passwordIconImage.centerXAnchor.constraint(equalTo: passwordIconView.centerXAnchor).isActive = true
        passwordIconImage.centerYAnchor.constraint(equalTo: passwordIconView.centerYAnchor).isActive = true
        
        loginBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        loginBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        infoLabel.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20).isActive = true
        
        extraInformation.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15).isActive = true
        extraInformation.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
        
        copyRightText.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40).isActive = true
        copyRightText.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
   
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func goToHomeController(){
        navigationController?.popToRootViewController(animated: true)
    }


}
