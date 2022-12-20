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
    let padding = UIEdgeInsets.init(top: 15, left: 15, bottom: 15, right: 15)
    let paddingTexting = UIEdgeInsets.init(top: 15, left: 15, bottom: 15, right: 63)
    let paddingRighview = UIEdgeInsets.init(top: 15, left: Constants.ScreenSizes.screenWidth-63, bottom: 15, right: 40)
    
    //MARK: Inits
    init(placeholder: String, keyboardType: UIKeyboardType = .default, isSecure: Bool = false) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder, keyboardType: keyboardType, isSecure: isSecure)
    }
    
    private func initDefault(placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.textFieldsBorderColors.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .textFieldsBackgroundColors
        self.textColor = .textFieldsTextColors
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldsPlaceholderColors])
        self.layer.cornerRadius = 10
        self.keyboardType = keyboardType
        self.autocorrectionType = .no
        if isSecure { passwordTextField() }
    }
    
    
    private func passwordTextField() {
        self.isSecureTextEntry = true
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(systemName: "eye.slash.fill", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [.textFieldsTextColors])), for: .normal)
        button.setImage(UIImage(systemName: "eye.fill", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [.textFieldsTextColors])), for: .selected)
        rightView = button
        rightViewMode = .always
        button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
    }
    
    @objc
    private func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Padding in textFields
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingRighview)
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingTexting)
    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingTexting)
    }
}
