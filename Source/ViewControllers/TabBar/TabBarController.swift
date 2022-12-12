//
//  TabBarController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 09/12/22.
//

import UIKit

class TabBarController: UITabBarController {
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        self.tabBar.isTranslucent = true
    }
}
