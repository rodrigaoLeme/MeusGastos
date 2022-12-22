//
//  SignUpCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

class SignUpCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SignUpViewController()
        
        viewController.onRegisterSuccess = {
            self.homeStart()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func homeStart() {
        self.navigationController.viewControllers.removeAll()
        
        let coordinator = TabBarCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
