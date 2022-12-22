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
    var onLoginSuccess: (() -> Void)?
    
    lazy var loginView: LoginView = {
       let view = LoginView()
        view.backgroundColor = .white
        view.onForgotTap = {
            self.onForgotTap?()
        }
        
        view.onLoginTap = { email, password in
            self.loginTap(email, password)
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
//        self.view.frame.origin.y -= keyboardSize.height
//        }
    }
    
    func loginTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
//    func showMessage(_ title: String, _ message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
}
