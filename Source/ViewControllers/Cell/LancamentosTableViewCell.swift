//
//  LancamentosTableViewCell.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 04/12/22.
//

import Foundation
import UIKit

class LancamentosTableViewCell: UITableViewCell {
    static let identifier: String = "LancamentosTableViewCell"
    
    var transactions: TransactionViewModel? {
        didSet {
            if let transactions = transactions {
                titleLabel.text = transactions.name
                categoryLabel.text = transactions.category.name
                amountLabel.text = String.setCurrencyString(value: Double(transactions.amount))
                dateLabel.text = String.setDateFormat(value: transactions.date)
                
                var config: UIImage.SymbolConfiguration
                
                if transactions.type == .input {
                    arrowImage.image = (UIImage(systemName: "arrow.up.circle.fill"))
                    config = UIImage.SymbolConfiguration(paletteColors: [.white, .inputsColor])
                    config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
                } else {
                    arrowImage.image = (UIImage(systemName: "arrow.down.circle.fill"))
                    config = UIImage.SymbolConfiguration(paletteColors: [.white, .outputsColor])
                    config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
                }
                
                arrowImage.preferredSymbolConfiguration = config
            }
        }
    }
    
    let arrowImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.up.circle.fill")
        
        var config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20))
        //config = config.applying(UIImage.SymbolConfiguration(paletteColors: [.white, .red]))
        
        img.preferredSymbolConfiguration = config
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let titleLabel: LabelDefault = {
        let lb = LabelDefault(text: "Salário", font: UIFont.systemFont(ofSize: 16))
        
        return lb
    }()
    
    let categoryLabel: LabelDefault = {
        let lb = LabelDefault(text: "Entradas", font: UIFont.systemFont(ofSize: 16))
        
        return lb
    }()
    
    let amountLabel: LabelDefault = {
        let lb = LabelDefault(text: String.setCurrencyString(value: 5000.1), font: UIFont.systemFont(ofSize: 16))
        lb.textColor = UIColor.blue
        
        return lb
    }()
    
    let dateLabel: LabelDefault = {
        let lb = LabelDefault(text: "29 jan", font: UIFont.systemFont(ofSize: 16))
        
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setCell()
    }
    
    private func setCell() {
        self.addSubview(arrowImage)
        self.addSubview(titleLabel)
        self.addSubview(categoryLabel)
        self.addSubview(amountLabel)
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            arrowImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            arrowImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            //arrowImage.widthAnchor.constraint(equalToConstant: 20),
            //arrowImage.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: arrowImage.trailingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
//            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
            
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//
            amountLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            dateLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
