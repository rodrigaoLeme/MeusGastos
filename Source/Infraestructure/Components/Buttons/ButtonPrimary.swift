//
//  ButtonPrimary.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit
import TransitionButton

class ButtonPrimary: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        initDefault(title: title)
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.tintColor = .white
        self.layer.cornerRadius = 10
        self.backgroundColor = .primaryButtonColors
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ButtonPrimary2: TransitionButton {
    init(title: String) {
        super.init(frame: .zero)
        
        initDefault(title: title)
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.tintColor = .white
        self.layer.cornerRadius = 10
        self.backgroundColor = .primaryButtonColors
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

