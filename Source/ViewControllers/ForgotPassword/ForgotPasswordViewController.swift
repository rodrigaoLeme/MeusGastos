//
//  ForgotPasswordViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 24/01/23.
//

import UIKit
import TransitionButton

class ForgotPasswordViewController: ViewControllerDefault {
    var onSendEmailTap: (() -> Void)?
    var onBackToLogin: (()->Void)?
    
    private lazy var forgotPasswordView: ForgotPasswordView = {
        let view = ForgotPasswordView()
        
        view.onSendEmailTap = { [weak self] email, button in
            guard let self = self else { return }
            self.sendEmailTap(email, button)
        }
        
        return view
    }()
    
    private func sendEmailTap (_ email: String, _ button: TransitionButton) {
        let userViewModel = UserViewModel()
        
        button.startAnimation()
        
        userViewModel.resendPassword(email) { [weak self] result in
            switch result {
            case .success(_):
                self?.view.endEditing(true)
                button.stopAnimation()
                //self?.showMessage("Atenção", "Siga as instruções que você recebeu por e-mail")
                
                let alert = UIAlertController(title: "Atenção", message: "Siga as instruções que você recebeu por e-mail", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self?.onBackToLogin?()
                }))
                self?.present(alert, animated: true, completion: nil)
                
            case .failure(let error):
                button.stopAnimation(animationStyle: .shake)
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    override func loadView() {
        self.view = forgotPasswordView
    }
}
