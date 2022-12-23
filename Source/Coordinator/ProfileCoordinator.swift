//
//  ProfileCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    lazy var profileViewController: ProfileViewController = {
        let viewController = ProfileViewController()
        viewController.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        viewController.title = "Perfil"
        
        viewController.onLogout = {
            self.startPresent()
        }
        
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ProfileViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startPresent() {
        //let viewController = PresentViewController()
        //self.navigationController.pushViewController(viewController, animated: true)
        self.navigationController.dismiss(animated: true)
    }
}
