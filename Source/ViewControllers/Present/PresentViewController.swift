//
//  PresentViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 13/12/22.
//

import UIKit

class PresentViewController: ViewControllerDefault {
    var onSignUp: (() -> Void)?
    var onLogin: (() -> Void)?
    
    private lazy var presentView: PresentView = {
        let view = PresentView()
        view.onSignUp = {[weak self] in
            guard let self = self else { return }
            self.onSignUp?()
        }
        
        view.onLogin = {[weak self] in
            guard let self = self else { return }
            self.onLogin?()
        }
        return view
    }()
    
    override func loadView() {
        self.view = presentView
    }
}
