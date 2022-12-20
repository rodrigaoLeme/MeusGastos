//
//  ViewInputOutput.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 01/12/22.
//

import Foundation
import UIKit

enum TypeEntry {
    case Input
    case Output
}

class ViewInputOutput: UIView {
    //MARK: Closures
    
    //MARK: Properts
    
    var typeEntry: TypeEntry
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var  valueLabel: LabelDefault = {
        let lb = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 25, weight: .bold))
        lb.textAlignment = .center
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.5

        return lb
    }()
    
    lazy var subtittleLabel: LabelDefault = {
        let lb = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 14, weight: .light))
        lb.textAlignment = .center
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.5
        
        return lb
    }()
    
    
    //MARK: Inits
    init(typeEntry: TypeEntry) {
        self.typeEntry = typeEntry
        super.init(frame: .zero)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setTypeEntry()
        setIcon()
        setValue()
        setSubtitle()
    }
    
    func setImageType(value: TypeEntry) -> UIImageView {
        let image = UIImageView()
        var config: UIImage.SymbolConfiguration
        image.translatesAutoresizingMaskIntoConstraints = false
        
        if value == .Input {
            image.image = (UIImage(systemName: "arrow.up.circle.fill"))
            config = UIImage.SymbolConfiguration(paletteColors: [.inputsColor, .black])
            config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
        } else {
            image.image = (UIImage(systemName: "arrow.down.circle.fill"))
            config = UIImage.SymbolConfiguration(paletteColors: [.outputsColor, .black])
            config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
        }
        
        image.preferredSymbolConfiguration = config
        
        return image
    }
    
    private func setTypeEntry() {
        switch typeEntry {
        case .Input:
            image = setImageType(value: .Input)
            subtittleLabel.text = "Entradas do Mês"
            self.backgroundColor = .inputsColor
        case .Output:
            image = setImageType(value: .Output)
            subtittleLabel.text = "Saídas do Mês"
            self.backgroundColor = .outputsColor
        }
    }
    
    func setValue(value: Double) {
        valueLabel.text = String.setCurrencyString(value: value)
    }
    
    private func setIcon() {
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
        ])
    }
    
    private func setValue() {
        self.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setSubtitle() {
        self.addSubview(subtittleLabel)
        
        NSLayoutConstraint.activate([
            subtittleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            subtittleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            subtittleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
