//
//  LoginCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 15/11/22.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onLoginSuccess = {
            self.showHome()
        }
        
        viewController.onForgotTap = {
            self.showForgotPassword()
        }
        
        viewController.onFacebookTap = {
            self.showHome()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showHome() {
        let coordinator = TabBarCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    private func showForgotPassword() {
        let coordinator = ForgotPasswordCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
}
