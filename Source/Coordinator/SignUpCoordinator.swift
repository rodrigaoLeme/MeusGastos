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
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
