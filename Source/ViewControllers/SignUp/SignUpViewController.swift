//
//  SignUpViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

class SignUpViewController: ViewControllerDefault {
    //MARK: Clousures
    var onRegisterSuccess: (() -> Void)?
    
    lazy var signUpView: SignUpView = {
        let view = SignUpView()
        
        view.onRegisterTap = { name, email, password in
            self.registerTap(name, email, password)
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
    
    func registerTap(_ name: String, _ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.setUserFromApi(name, email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
}
