//
//  LoginView.swift
//  MeusGastos




//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    //MARK: LabelDefault
    let titleLabel = LabelDefault(text: "Login", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    let emailLabel = LabelDefault(text: "Email")
    let passwordLabel = LabelDefault(text: "Senha")
    
    //MARK: TextFieldDefault
    let emailTextField = TextFieldDefault(placeholder: "Infomer seu e-mail", keyboardType: .emailAddress)
    let passwordTextField = TextFieldDefault(placeholder: "", isSecure: true)
    
    
    //MARK: ButtonDefault
    let buttonLogin = ButtonDefault(title: "Entrar")
    let buttonRegister = ButtonDefault(title: "Registrar")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setElementsVisual()
    }
    
    private func setElementsVisual() {
        setTitle()
        setEmail()
        setPassword()
        setButtonLogin()
        setButtonRegister()
    }
    
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setEmail() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
            emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: emailLabel.rightAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setPassword() {
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            passwordLabel.rightAnchor.constraint(equalTo: emailTextField.rightAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 12),
            passwordTextField.leftAnchor.constraint(equalTo: passwordLabel.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: passwordLabel.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setButtonLogin() {
        self.addSubview(buttonLogin)
        
        buttonLogin.addTarget(self, action: #selector(buttonLoginTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setButtonRegister() {
        self.addSubview(buttonRegister)
        
        buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 30),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func buttonRegisterTap() {
        self.onRegisterTap?()
    }
    
    @objc
    func buttonLoginTap() {
        self.onLoginTap?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
