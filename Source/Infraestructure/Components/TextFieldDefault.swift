//
//  TextFieldDefault.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 29/11/22.
//

import Foundation
import UIKit

class TextFieldDefault: UITextField {    
    //MARK: Constants
    let padding = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
    
    //MARK: Inits
    init(placeholder: String, keyboardType: UIKeyboardType = .default, isSecure: Bool = false) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder, keyboardType: keyboardType, isSecure: isSecure)
    }
    
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .lightGray
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecure
        self.keyboardType = keyboardType
        self.autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Padding in textFields
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
