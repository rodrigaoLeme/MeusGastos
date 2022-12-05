//
//  RegisterView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 30/11/22.
//

import UIKit

class RegisterView: UIView {
    var onLoginTap: (() -> Void)?
    
    //MARK: Visual Elements
    let titleLabel = LabelDefault(text: "Cadastro de Usuário", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    let emailLabel = LabelDefault(text: "Email")
    let passwordLabel = LabelDefault(text: "Senha")
    
    let emailTextField = TextFieldDefault(placeholder: "Email para o cadastro", keyboardType: .emailAddress)
    let passwordTextField = TextFieldDefault(placeholder: "Sua Senha para o cadastro", isSecure: true)
    
    let buttonRegister = ButtonDefault(title: "Registrar Usuário")
    let buttonLogin = ButtonDefault(title: "Logar")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setVisualElements()
    }
    
    
    private func setVisualElements() {
        setTitle()
        setEmail()
        setPassword()
        setButtonRegister()
        setButtonLogin()
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
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
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
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setButtonRegister() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setButtonLogin() {
        self.addSubview(buttonLogin)
        
        buttonLogin.addTarget(self, action: #selector(buttonLoginTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 30),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func buttonLoginTap() {
        self.onLoginTap?()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
