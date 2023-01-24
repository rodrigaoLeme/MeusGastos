//
//  ForgotPasswordCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 24/01/23.
//

import UIKit

class ForgotPasswordCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ForgotPasswordViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
