//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class LoginViewController: ViewControllerDefault {
    var onForgotTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    lazy var loginView: LoginView = {
       let view = LoginView()
        view.backgroundColor = .white
        view.onForgotTap = {
            self.onForgotTap?()
        }
        view.onLoginTap = {
            self.onLoginTap?()
        }
        
//        view.onLoginTap = {[weak self] in
//            guard let self = self else { return }
//            self.loginTap(email, password)
//        }
        return view
    }()
    
    override func loadView() {
        self.view = loginView
        
//        self.afterHideKeyboard = {
//            print("teclado sumiu")
//        }
//
//        self.afterShowKeyboard = { heightKeyboard in
//            print("O Teclado subiu com \(heightKeyboard) de altura")
//        self.view.frame.origin.y -= keyboardSize.height
//        }
    }
    
    func loginTap(_ email: String, _ password: String) {
        
    }
}
