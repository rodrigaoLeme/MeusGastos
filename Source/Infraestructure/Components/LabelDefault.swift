//
//  LabelDefault.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class LabelDefault: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text)
    }
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: font)
    }
    
    private func initDefault(text: String, font: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
