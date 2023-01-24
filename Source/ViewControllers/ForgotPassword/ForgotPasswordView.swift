//
//  ForgotPasswordView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 24/01/23.
//

import UIKit
import TransitionButton

class ForgotPasswordView: UIView {
    //MARK: Closures
    var onSendEmailTap: ((_ email: String, _ button: TransitionButton) -> Void)?
    
    //MARK: Properts
    lazy var imgLogin: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "loginImage")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var emailTextField = TextFieldDefault(placeholder: "E-mail", keyboardType: .emailAddress)
    
    lazy var forgotButton = ButtonPrimaryTransition(title: "Enviar E-mail")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setImage()
        setTextField()
        setForgotButton()
    }
    
    private func setImage() {
        self.addSubview(imgLogin)
        
        NSLayoutConstraint.activate([
            imgLogin.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            imgLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imgLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    private func setTextField() {
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: imgLogin.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setForgotButton() {
        self.addSubview(forgotButton)
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            forgotButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            forgotButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            forgotButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
