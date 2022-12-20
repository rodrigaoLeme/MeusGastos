//
//  ButtonDefault.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class ButtonDefault: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        initDefault(title: title)
    }
    
    private func initDefault(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = .blue
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
