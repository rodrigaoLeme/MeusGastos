//
//  ForgotPasswordViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 24/01/23.
//

import UIKit

class ForgotPasswordViewController: ViewControllerDefault {
    private lazy var forgotPasswordView: ForgotPasswordView = {
        let view = ForgotPasswordView()
        
        return view
    }()
    
    override func loadView() {
        self.view = forgotPasswordView
    }
}
