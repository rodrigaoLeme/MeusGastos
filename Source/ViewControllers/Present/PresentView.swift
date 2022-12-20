//
//  PresentView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 13/12/22.
//

import UIKit

class PresentView: UIView {
    //MARK: Closures
    var onSignUp: (() -> Void)?
    var onLogin: (() -> Void)?
    
    //MARK: Constants
    let width: CGFloat = UIScreen.main.bounds.width
    
    //MARK: Properts
    lazy var imgPresent: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "presentImage")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var titlePresent: LabelDefault = {
        let txt = LabelDefault(text: "Vamos poupar juntos?", font: UIFont.systemFont(ofSize: 23, weight: .bold))
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        return txt
    }()
    
    lazy var subtitlePresent: LabelDefault = {
        let txt = LabelDefault(text: "Uma maneira simples e fácil de começar a acompanhar suas finanças")
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        txt.textColor = UIColor.lightGray
        
        return txt
    }()
    
    lazy var createAccountButton = ButtonPrimary(title: "Criar Conta")
    
    lazy var loginScreenButton = ButtonSecundary(title: "Entrar")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setTitle()
        setImg()
        setSubtitle()
        setLoginButton()
        setSingupButton()
    }
    
    func setTitle() {
        self.addSubview(titlePresent)
        
        NSLayoutConstraint.activate([
            titlePresent.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titlePresent.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func setImg() {
        self.addSubview(imgPresent)
        
        NSLayoutConstraint.activate([
            imgPresent.bottomAnchor.constraint(equalTo: titlePresent.topAnchor, constant: -35),
            imgPresent.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imgPresent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            imgPresent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    func setSubtitle() {
        self.addSubview(subtitlePresent)
        
        NSLayoutConstraint.activate([
            subtitlePresent.topAnchor.constraint(equalTo: titlePresent.bottomAnchor, constant: 24),
            subtitlePresent.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitlePresent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            subtitlePresent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func setLoginButton() {
        self.addSubview(loginScreenButton)
        
        loginScreenButton.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginScreenButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            loginScreenButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            loginScreenButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            loginScreenButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setSingupButton() {
        self.addSubview(createAccountButton)
        
        createAccountButton.addTarget(self, action: #selector(signUpTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            createAccountButton.bottomAnchor.constraint(equalTo: loginScreenButton.topAnchor, constant: -20),
            createAccountButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            createAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc
    func signUpTap() {
        self.onSignUp?()
    }
    
    @objc
    func loginTap() {
        self.onLogin?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
