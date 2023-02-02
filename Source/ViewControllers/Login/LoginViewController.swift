//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit
import TransitionButton
import GoogleSignIn
import FirebaseCore

class LoginViewController: ViewControllerDefault {
    var onForgotTap: (() -> Void)?
    var onLoginSuccess: (() -> Void)?
    var onFacebookTap: (() -> Void)?
    var onGoogleTap: (() -> Void)?
    
    lazy var loginView: LoginView = {
       let view = LoginView()
        view.backgroundColor = .white
        view.onForgotTap = {
            self.onForgotTap?()
        }
        
        view.onLoginTap = { email, password, button in
            self.loginTap(email, password, button)
        }
        
        view.onEditingTextView = { [weak self] textField in
            guard let self = self else { return }
            self.receiveTextField(textField)
        }
        
        view.onFacebookTap = {[weak self] in
            guard let self = self else { return }
            self.loginFacebook()
        }
        
        view.onGoogleTap = {[weak self] in
            guard let self = self else { return }
            self.loginGoogle()
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
    
    func loginTap(_ email: String, _ password: String, _ button: TransitionButton) {
        let userViewModel = UserViewModel()
        
        /// start da animação do botão
        button.startAnimation()
        
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.view.endEditing(true)
                button.stopAnimation(animationStyle: .expand) {
                    self?.onLoginSuccess?()
                }
            case .failure(let error):
                button.stopAnimation(animationStyle: .shake) {
                    self?.showMessage("Erro", error.localizedDescription)
                }
                
            }
        }
    }
    
    func loginFacebook() {
        let userViewModel = UserViewModel()
        
        userViewModel.registerFacebook { [weak self] result in
            switch result {
            case .success(_):
                self?.onFacebookTap?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    func loginGoogle() {
        let userViewModel = UserViewModel()
        
        GIDSignIn.sharedInstance.signOut()
        
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            if let error = error {
                self.showMessage("Erro", error.localizedDescription)
            } else {
                userViewModel.registerGoogle(signResult: result!) { resultado in
                    switch resultado {
                    case .success(_):
                        self.onGoogleTap?()
                    case .failure(let error):
                        self.showMessage("Erro", error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func receiveTextField(_ sender: UITextField) {
        print("recebendo o textField por clousure")
    }
}
