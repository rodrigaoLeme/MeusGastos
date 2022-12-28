//
//  ProfileView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit
import TransitionButton

class ProfileView: UIView {
    //MARK: Closures
    var onLogout: ((_ : TransitionButton) -> Void)?
    
    //MARK: Properts
    let userViewModel = UserViewModel()
    var currentUser = [TypeOfUserDetail: String]()
    
    lazy var helloMessage: LabelDefault = {
        let lb = LabelDefault(text: "Olá, Lorem Ipsum", font: .systemFont(ofSize: 18, weight: .bold))
        
        return lb
    }()
    
    lazy var btnLogout: ButtonPrimaryTransition = {
        let btn = ButtonPrimaryTransition(title: "Logout")
        
        return btn
    }()
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.currentUser = userViewModel.getUserDetails()
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setButtonLogout()
        setHelloMessage()
    }
    
    private func setButtonLogout() {
        self.addSubview(btnLogout)
        
        btnLogout.addTarget(self, action: #selector(logoutTap(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            btnLogout.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnLogout.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            btnLogout.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            btnLogout.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            btnLogout.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setHelloMessage() {
        self.addSubview(helloMessage)
        
        if let currentDisplayName = currentUser[.displayName] {
            helloMessage.text = "Olá, \(currentDisplayName)"
        }
        
        NSLayoutConstraint.activate([
            helloMessage.bottomAnchor.constraint(equalTo: btnLogout.topAnchor, constant: -20),
            helloMessage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    @objc
    private func logoutTap(_ sender: TransitionButton) {
        onLogout?(sender)
    }    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
