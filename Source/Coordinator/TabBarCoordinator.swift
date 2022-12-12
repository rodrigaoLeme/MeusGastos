//
//  TabBarCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 09/12/22.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        let categoryCoordinator = CategoryCoordinator(navigationController: self.navigationController)
        
        tabBarController.setViewControllers([
            homeCoordinator.homeViewController,
            categoryCoordinator.categoryViewController
        ], animated: true)
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
}
