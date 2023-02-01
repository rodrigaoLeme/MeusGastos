//
//  SignUpView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit
import TransitionButton

class SignUpView: UIView {
    //MARK: Closures
    var onRegisterTap: ((_ name: String, _ email: String, _ password: String, _ button: TransitionButton) -> Void)?
    var onRegisterFacebookTap: (()->Void)?
    
    
    //MARK: Properts
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    lazy var imgSignUp: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "signUpImage")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var facebookButton = ButtonSocialMedias(typeSocialMedia: .facebook)
    lazy var googleButton = ButtonSocialMedias(typeSocialMedia: .google)
    
    let nameTextField = TextFieldDefault(placeholder: "Nome")
    let emailTextField = TextFieldDefault(placeholder: "Email", keyboardType: .emailAddress)
    let senhaTextField = TextFieldDefault(placeholder: "Senha", isSecure: true)
    
    lazy var createButton = ButtonPrimaryTransition(title: "cadastrar")
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setupScrollView()
        setImg()
        setSocialMediaButtons()
        setTextFields()
        setCreateButton()
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
    
    private func setImg() {
        contentView.addSubview(imgSignUp)
        
        NSLayoutConstraint.activate([
            imgSignUp.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgSignUp.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgSignUp.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setSocialMediaButtons() {
        contentView.addSubview(facebookButton)
        contentView.addSubview(googleButton)
        
        facebookButton.addTarget(self, action: #selector(registerFacebookTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: imgSignUp.bottomAnchor, constant: 10),
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
        contentView.addSubview(nameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(senhaTextField)
        
        nameTextField.tag = 1
        nameTextField.delegate = self
        
        emailTextField.tag = 2
        emailTextField.delegate = self
        
        senhaTextField.tag = 3
        senhaTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            senhaTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            senhaTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            senhaTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            senhaTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setCreateButton() {
        contentView.addSubview(createButton)
        
        createButton.addTarget(self, action: #selector(registerButtonTap(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            //createButton.topAnchor.constraint(greaterThanOrEqualTo: senhaTextField.bottomAnchor, constant: setBottomConstant()),
            //createButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            createButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            createButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            createButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            createButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func calculateWithButton() -> CGFloat{
        return (Constants.ScreenSizes.screenWidth / 2) - 30
    }
    
    func setBottomConstant() -> CGFloat {
        switch (Constants.ScreenSizes.screenHeight) {
        case 932.0, 852.0:
            return -132
        case 667.0:
            return 0
        default:
            return -60
        }
    }
    
    @objc
    func registerFacebookTap() {
        self.onRegisterFacebookTap?()
    }
    
    @objc
    func registerButtonTap(_ button: TransitionButton) {
        if let name = nameTextField.text, let email = emailTextField.text, let password = senhaTextField.text {
            self.onRegisterTap?(name, email, password, button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            superview?.endEditing(true)
            //self.view.frame.origin.y = 0.0
        }

        return true
    }
}
