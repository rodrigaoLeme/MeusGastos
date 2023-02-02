//
//  SignUpViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit
import TransitionButton
import GoogleSignIn
import FirebaseCore

class SignUpViewController: ViewControllerDefault {
    //MARK: Clousures
    var onRegisterSuccess: (() -> Void)?
    var onFacebookTap: (() -> Void)?
    var onGoogleTap: (() -> Void)?
    
    lazy var signUpView: SignUpView = {
        let view = SignUpView()
        
        view.onRegisterTap = { name, email, password, button in
            self.registerTap(name, email, password, button)
        }
        
        view.onRegisterFacebookTap = {[weak self] in
            guard let self = self else { return }
            self.registerFacebook()
        }
        
        view.onRegisterGoogleTap = {[weak self] in
            guard let self = self else { return }
            self.registerGoogle()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = signUpView
        
        self.afterHideKeyboard = {
            print("teclado sumiu")
            self.view.frame.origin.y = 0.0
        }

        self.afterShowKeyboard = { heightKeyboard in
            print("O Teclado subiu com \(heightKeyboard) de altura")
            print(self.view.frame.origin.y)
            if (self.view.frame.origin.y == 0) {
                self.view.frame.origin.y -= heightKeyboard
            }
        }
    }
    
    func registerTap(_ name: String, _ email: String, _ password: String, _ button: TransitionButton) {
        let userViewModel = UserViewModel()
        
        /// start da animação do botão
        button.startAnimation()
        
        userViewModel.setUserFromApi(name, email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.view.endEditing(true)
                button.stopAnimation(animationStyle: .expand) {
                    self?.onRegisterSuccess?()
                }
            case .failure(let error):
                button.stopAnimation(animationStyle: .shake){
                    self?.showMessage("Erro", error.localizedDescription)
                }
            }
        }
    }
    
    func registerFacebook() {
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
    
    func registerGoogle() {
        let userViewModel = UserViewModel()
        
        GIDSignIn.sharedInstance.signOut()
        
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            if let error = error {
                self.showMessage("Erro", error.localizedDescription)
            } else {
                userViewModel.registerGoogle(signResult: result!) {[weak self] resultado in
                    switch resultado {
                    case .success(_):
                        self?.onGoogleTap?()
                    case .failure(let error):
                        self?.showMessage("Erro", error.localizedDescription)
                    }
                }
            }
        }
    }
}
