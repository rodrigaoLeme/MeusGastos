//
//  ProfileViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit

class ProfileViewController: ViewControllerDefault {
    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        
        return view
    }()
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.title = "Perfil"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
