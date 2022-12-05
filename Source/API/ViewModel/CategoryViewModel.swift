//
//  CategoryViewModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 01/12/22.
//

import Foundation

typealias CategoriesViewModel = [CategoryViewModel]

class CategoryViewModel {
    let model: CategoryModel
    
    init(withModel model: CategoryModel) {
        self.model = model
    }
    
    var id: Int {
        model.id ?? 0
    }
    
    var name: String {
        model.name ?? String.empty
    }
    
    var about: String {
        model.about ?? String.empty
    }
    
    var uid: String {
        model.uid ?? String.empty
    }
    
    func mock() -> CategoriesViewModel {
        var mocks = CategoriesViewModel()
        
        let model = CategoryModel(id: 1, name: "Contas Fixas", about: "Contas que se pagam todo mês.", uid: "codadndoComMoa")
        
        let viewModel = CategoryViewModel(withModel: model)
        
        mocks.append(viewModel)
        
        // OU
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 2, name: "Salário", about: "Salário do mês", uid: "CodandoComMoa")))
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 3, name: "Sem Categoria", about: "Lançamentos que não possuem cateogiras", uid: "CodandoComMoa")))
        
        
        
        return mocks
    }
}
