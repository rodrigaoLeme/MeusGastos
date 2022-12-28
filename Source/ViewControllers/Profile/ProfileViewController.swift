//
//  ProfileViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 22/12/22.
//

import UIKit
import TransitionButton

class ProfileViewController: ViewControllerDefault {
    var onLogout: (()->Void)?
    
    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.onLogout = {[weak self] button in
            guard let self = self else { return }
            self.logOut(button)
            //self.onLogout?()
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
    
    private func logOut(_ sender: TransitionButton) {
        let userViewModel = UserViewModel()
        
        /// srtart da aninação
        sender.startAnimation()
        
        if userViewModel.logout() {
            sender.stopAnimation()
            self.onLogout?()
        } else {
            sender.stopAnimation(animationStyle: .shake) {
                self.showMessage("Atenção", "Erro ao efetuar logout.")
            }
        }
    }
}
