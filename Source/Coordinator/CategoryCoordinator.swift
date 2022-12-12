//
//  CategoryCoordinator.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 09/12/22.
//

import UIKit

class CategoryCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    lazy var categoryViewController: CategoryViewController = {
        let viewController = CategoryViewController()
        viewController.tabBarItem.image = UIImage(systemName: "list.bullet.circle.fill")
        viewController.title = "Categorias"
        
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CategoryViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
