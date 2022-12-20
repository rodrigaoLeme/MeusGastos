//
//  ButtonSecundary.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

class ButtonSecundary: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        initDefault(title: title)
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.setTitleColor(.primaryButtonColors, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.primaryButtonColors.cgColor
        self.layer.borderWidth = 1
        //self.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
