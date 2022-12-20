//
//  SignUpViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

class SignUpViewController: ViewControllerDefault {
    
    var signUpView: SignUpView = {
        let view = SignUpView()
        
        return view
    }()
    
    override func loadView() {
        self.view = signUpView
        
        self.afterHideKeyboard = {
            print("teclado sumiu")
            self.view.frame.origin.y = 0.0
        }

        self.afterShowKeyboard = { heightKeyboard in
            print("O Teclado subiu com \(heightKeyboard) de altura")
            print(self.view.frame.origin.y)
            if (self.view.frame.origin.y == 0) {
                self.view.frame.origin.y -= heightKeyboard
            }
        }
    }
    
}
