//
//  HomeCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 30/11/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    lazy var homeViewController: HomeViewController = {
        let viewController = HomeViewController()
        viewController.tabBarItem.image = UIImage(systemName: "dollarsign.circle.fill")
        viewController.title = "Meus Gastos"
        
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
