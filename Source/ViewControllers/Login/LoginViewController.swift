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
        
        view.onEditingTextView = { [weak self] textField in
            guard let self = self else { return }
            self.receiveTextField(textField)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
        
        self.afterHideKeyboard = {
            self.view.frame.origin.y = 0.0
        }
        
        self.afterShowKeyboard = { heightKeyboard in
            /// seto o origin com 0 porque em alguns aparelhos o keyboard sugere usar alguma senha salva no icloud e isso fazia a rotina rodar duas vezes, uma com altura normal do teclado e outra com a adição da opção do icloud
            self.view.frame.origin.y = 0.0
            self.view.frame.origin.y -= heightKeyboard
        }
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
    
    func receiveTextField(_ sender: UITextField) {
        print("recebendo o textField por clousure")
    }
}
