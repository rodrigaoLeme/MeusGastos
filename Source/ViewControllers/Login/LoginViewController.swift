//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class LoginViewController: ViewControllerDefault {
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    lazy var loginView: LoginView = {
       let view = LoginView()
        view.backgroundColor = .white
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        view.onLoginTap = {
            self.onLoginTap?()
        }
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
//        }
    }
}
