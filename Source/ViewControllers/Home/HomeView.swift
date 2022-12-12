//
//  HomeView.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 30/11/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var mock = TransactionViewModel.mock()
    
    //MARK: Closures
    
    //MARK: Constants
    let width: CGFloat = UIScreen.main.bounds.width - 36
    
    //MARK: Properts
    lazy var segmentedControl: UISegmentedControl = {
        var segmented = UISegmentedControl(items: ["Hoje","Essa Semana","Esse Mês","Todos"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = .lightGray
        segmented.selectedSegmentIndex = 1
        
        return segmented
    }()
    
    lazy var viewInputs: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Input)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    lazy var viewOutputs: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Output)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    lazy var lancamentos: LabelDefault = {
        let lb = LabelDefault(text: "Lançamentos", font: UIFont.systemFont(ofSize: 32, weight: .semibold))
        
        return lb
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        //tb.isScrollEnabled = false
        tb.separatorStyle = .singleLine
        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = UIColor.clear
        tb.register(LancamentosTableViewCell.self, forCellReuseIdentifier: LancamentosTableViewCell.identifier)
        
        return tb
    }()
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        setValue()
        setSegmented()
        setViewInputs()
        setViewOutputs()
        setLancamento()
        setTable()
    }
    
    private func calcAmout(type: TypeEntryTransacition) -> Double {
        var result: Double = 0
        for i in mock {
            (i.type == type) ? (result += i.amount) : nil
        }
        
        return result
    }
    
    private func setValue() {
        self.viewInputs.setValue(value: calcAmout(type: .input))
        self.viewOutputs.setValue(value: calcAmout(type: .output))
    }
    
    private func setSegmented() {
        self.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            segmentedControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setViewInputs() {
        self.addSubview(viewInputs)
        
        NSLayoutConstraint.activate([
            viewInputs.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            viewInputs.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            viewInputs.widthAnchor.constraint(equalToConstant: width / 2),
            //viewInputs.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            viewInputs.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func setViewOutputs() {
        self.addSubview(viewOutputs)
        
        NSLayoutConstraint.activate([
            viewOutputs.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            //viewOutputs.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            viewOutputs.widthAnchor.constraint(equalToConstant: width / 2),
            viewOutputs.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            viewOutputs.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func setLancamento() {
        self.addSubview(lancamentos)
        
        NSLayoutConstraint.activate([
            lancamentos.topAnchor.constraint(equalTo: viewInputs.bottomAnchor, constant: 22),
            lancamentos.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
        ])
    }
    
    private func setTable() {
        self.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lancamentos.bottomAnchor, constant: 12),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LancamentosTableViewCell.identifier, for: indexPath) as! LancamentosTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.transactions = self.mock[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
