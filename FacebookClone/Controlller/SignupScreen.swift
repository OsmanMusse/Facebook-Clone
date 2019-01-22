//
//  SignupScreen.swift
//  FacebookClone
//
//  Created by Mezut on 20/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit






class SignupScreen: UIViewController {
    
    
    let facebookLogo: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Facebook-logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.text = "Create New Account"
        label.font = UIFont(name: "Helvetica-Bold", size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: CustomTextField = {
        let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let textField = CustomTextField(padding: padding)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Imie", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, .font: UIFont(name: "Helvetica-Bold", size: 19)])
        textField.textColor = .white
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let passwordTextField: CustomTextField = {
        let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let textField = CustomTextField(padding: padding)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Nazwisko", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, .font: UIFont(name: "Helvetica-Bold", size: 19)])
        textField.textColor = .red
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: CustomTextField = {
        let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let textField = CustomTextField(padding: padding)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, .font: UIFont(name: "Helvetica-Bold", size: 19)])
        
        textField.textColor = .white
        textField.backgroundColor = UIColor(r: 51, g: 85, b: 150, a: 100)
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Signup").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Mezczyzna", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 15.5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = UIColor(r: 147, g: 165, b: 199, a: 100)
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nastepny Krok", for: .normal)
        button.setTitleColor(Colors.mainBgColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(r: 249, g: 249, b: 249, a: 100)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let moreInfoText: UILabel = {
        let label = UILabel()
        label.text = "Kilkajcq prycpick Nasatropny krck akcplujorn norz rgulamin"
        label.font = UIFont(name: "Helvetica-Bold", size: 12)
        label.textColor = UIColor(r: 147, g: 165, b: 199, a: 100)
        label.widthAnchor.constraint(equalToConstant: 341.5).isActive = true
        label.numberOfLines = 2
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
    

    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "SignIn").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(dosomething), for: .touchUpInside)
        button.setTitle("Mezczyna", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 15.5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = UIColor(r: 147, g: 165, b: 199, a: 100)
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    
    @objc func dosomething() {
        let loginController = LoginScreen()
        navigationController?.pushViewController(loginController, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = Colors.mainBgColor
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(facebookLogo)
        view.addSubview(welcomeText)

        
        setupTextField()
        
        // AutoLayout
        NSLayoutConstraint.activate([
    
           facebookLogo.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
           facebookLogo.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 0),
           
           welcomeText.topAnchor.constraint(equalTo: facebookLogo.bottomAnchor, constant: 35),
           welcomeText.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 0),
           
           
           
            
            ])
        
    }
    
    func setupTextField() {
        let arrangedSubviews: [UITextField] = [nameTextField,passwordTextField,emailTextField]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        view.addSubview(signInButton)
        view.addSubview(signOutButton)
        view.addSubview(signUpButton)
        view.addSubview(moreInfoText)
        view.addSubview(copyRightText)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 48).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        
        signOutButton.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor, constant: 140).isActive = true
        signOutButton.topAnchor.constraint(equalTo: signInButton.topAnchor).isActive = true
        
        signUpButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: signOutButton.bottomAnchor, constant: 40).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        moreInfoText.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50).isActive = true
        moreInfoText.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor).isActive = true
        
        copyRightText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        copyRightText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
   
    
    
    // Overides the status bar color from black to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    

}


