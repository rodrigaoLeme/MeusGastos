//
//  HomeViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 30/11/22.
//

import Foundation
import UIKit

class HomeViewController: ViewControllerDefault {
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .background
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.title = "Meus Gastos"
        //self.title = "Meus Gastos"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
