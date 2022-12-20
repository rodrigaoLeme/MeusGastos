//
//  PresentCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 13/12/22.
//

import UIKit

class PresentCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = PresentViewController()
        
        viewController.onSignUp = {
            self.startSignUp()
        }
        
        viewController.onLogin = {
            self.startLogin()
        }
        
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startSignUp() {
        let coordinator = SignUpCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    private func startLogin() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
