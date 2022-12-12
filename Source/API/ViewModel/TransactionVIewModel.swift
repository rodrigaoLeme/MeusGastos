//
//  TransactionVIewModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 01/12/22.
//

import Foundation

enum TypeEntryTransacition: Int {
    case input = 0
    case output = 1
}

typealias TransactionsViewModel = [TransactionViewModel]

struct TransactionViewModel {
    let model: TransactionModel
    
    init(withModel model: TransactionModel) {
        self.model = model
    }
    
    var id: Int {
        model.id ?? 0
    }
    
    var name: String {
        model.name ?? .empty
    }
    
    var category: CategoryViewModel {
        CategoryViewModel.init(withModel: model.category ?? CategoryModel.init())
    }
    
    var date: Date {
        model.date ?? Date()
    }
    
    var amount: Double {
        model.amount ?? 0
    }
    
    var uid: String {
        model.uid ?? .empty
    }
    
    var type: TypeEntryTransacition {
        model.type == 0 ? .input : .output
    }
    
    static func mock() -> TransactionsViewModel {
        var mock = [TransactionViewModel]()
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 1, name: "Salário de Maio", category: CategoryModel(id: 2, name: "Salário do mês", about: "", uid: "CodandoComMoa"), date: Date(), amount: 5000, uid: "CodandoComMoa", type: 0)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 1, name: "Freela de Maio", category: CategoryModel(id: 2, name: "Salário do mês", about: "", uid: "CodandoComMoa"), date: Date(), amount: 3000, uid: "CodandoComMoa", type: 0)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 1, name: "Mesada do Papai", category: CategoryModel(id: 2, name: "Salário do mês", about: "", uid: "CodandoComMoa"), date: Date(), amount: 500, uid: "CodandoComMoa", type: 0)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 2, name: "Agua de Maio", category: CategoryModel(id: 1, name: "Despesas Fixas", about: "", uid: "CodandoComMoa"), date: Date(), amount: 120, uid: "CodandoComMoa", type: 1)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 2, name: "Luz de Maio", category: CategoryModel(id: 1, name: "Despesas Fixas", about: "", uid: "CodandoComMoa"), date: Date(), amount: 420, uid: "CodandoComMoa", type: 1)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 2, name: "Aluguel de Maio", category: CategoryModel(id: 1, name: "Despesas Fixas", about: "", uid: "CodandoComMoa"), date: Date(), amount: 1500, uid: "CodandoComMoa", type: 1)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 2, name: "Financiamento de Maio", category: CategoryModel(id: 1, name: "Despesas Fixas", about: "", uid: "CodandoComMoa"), date: Date(), amount: 750, uid: "CodandoComMoa", type: 1)))
        
        mock.append(TransactionViewModel(withModel: TransactionModel(id: 2, name: "Cinema", category: CategoryModel(id: 1, name: "Despesas Alternativas", about: "", uid: "CodandoComMoa"), date: Date(), amount: 40, uid: "CodandoComMoa", type: 1)))
        
        return mock
    }
}
