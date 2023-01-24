//
//  LoginView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit
import TransitionButton

class LoginView: UIView {
    //MARK: Closures
    var onForgotTap: (() -> Void)?
    var onLoginTap: ((_ email: String, _ password: String, _ button: TransitionButton) -> Void)?
    var onEditingTextView: ((_ sender: UITextField) -> Void)?
    
    //MARK: Properties
    lazy var contentViewSize = CGSize(width: self.frame.width, height: self.frame.height)
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    lazy var imgLogin: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "loginImage")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var facebookButton = ButtonSocialMedias(typeSocialMedia: .facebook)
    lazy var googleButton = ButtonSocialMedias(typeSocialMedia: .google)
    
    let emailTextField = TextFieldDefault(placeholder: "Email", keyboardType: .emailAddress)
    let senhaTextField = TextFieldDefault(placeholder: "Senha", isSecure: true)
    
    lazy var loginButton = ButtonPrimaryTransition(title: "Entrar")
    lazy var forgotPasswordButton = ButtonTextOnly(title: "Esqueci a senha :/")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setElementsVisual()
    }
    
    private func setElementsVisual() {
        setupScrollView()
        setImage()
        setSocialMediaButtons()
        setTextFields()
        setForgotButton()
        setLoginButton()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, constant: setBottomConstant())
        ])
        
    }
    
    private func setImage() {
        contentView.addSubview(imgLogin)
        
        NSLayoutConstraint.activate([
            imgLogin.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imgLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
    
    private func setSocialMediaButtons() {
        contentView.addSubview(facebookButton)
        contentView.addSubview(googleButton)
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: imgLogin.bottomAnchor, constant: 20),
            facebookButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.widthAnchor.constraint(equalToConstant: calculateWithButton())
        ])
        
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: facebookButton.topAnchor),
            googleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.widthAnchor.constraint(equalToConstant: calculateWithButton())
        ])
    }
    
    private func setTextFields() {
        contentView.addSubview(emailTextField)
        contentView.addSubview(senhaTextField)
        
        emailTextField.tag = 1
        emailTextField.delegate = self
        
        senhaTextField.tag = 2
        senhaTextField.delegate = self
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            senhaTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            senhaTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            senhaTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            senhaTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func setForgotButton() {
        contentView.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.addTarget(self, action: #selector(buttonForgotTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setLoginButton() {
        contentView.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(buttonLoginTap(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: Actions
    @objc
    func buttonForgotTap() {
        self.onForgotTap?()
    }
    
    @objc
    func buttonLoginTap(_ button: TransitionButton) {
        if let email = emailTextField.text, let password = senhaTextField.text {
            self.onLoginTap?(email, password, button)
        }
    }
    
    //MARK: Functions
    private func calculateWithButton() -> CGFloat{
        return (Constants.ScreenSizes.screenWidth / 2) - 30
    }
    
    func setBottomConstant() -> CGFloat {
        print(Constants.ScreenSizes.screenHeight)
        switch (Constants.ScreenSizes.screenHeight) {
        case 932.0:
            return -130
        case 844:
            return -110
        case 667.0:
            return 0
        default:
            return -20
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Extensions
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            superview?.endEditing(true)
        }

        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.onEditingTextView?(textField)
        return true
    }
}
