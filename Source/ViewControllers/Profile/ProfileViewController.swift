//
//  ProfileViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit

class ProfileViewController: ViewControllerDefault {
    var onLogout: (()->Void)?
    
    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.onLogout = {[weak self] in
            guard let self = self else { return }
            self.onLogout?()
        }
        
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
