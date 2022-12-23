//
//  ProfileView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit
import FirebaseAuth

class ProfileView: UIView {
    //MARK: Closures
    var onLogout: (() -> Void)?
    
    //MARK: Properts
    lazy var btnLogout: ButtonDefault = {
        let btn = ButtonDefault(title: "Logout")
        
        return btn
    }()
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setButtonLogout()
    }
    
    private func setButtonLogout() {
        self.addSubview(btnLogout)
        
        btnLogout.addTarget(self, action: #selector(logoutTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            btnLogout.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btnLogout.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            btnLogout.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            btnLogout.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            btnLogout.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc
    private func logoutTap() {
        do {
            try Auth.auth().signOut()
            onLogout?()
        } catch let err {
            print(err)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
