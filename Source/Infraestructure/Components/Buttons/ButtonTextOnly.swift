//
//  ButtonTextOnly.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import UIKit

class ButtonTextOnly: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        initDefault(title: title)
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = .textOnlyBackgroundColors
        self.setTitleColor(.textOnlyColors, for: .normal)
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

