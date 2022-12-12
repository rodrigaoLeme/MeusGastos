//
//  CategoryViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 09/12/22.
//

import UIKit

class CategoryViewController: ViewControllerDefault {
    private lazy var categoryView: CategoryView = {
        let view = CategoryView()
        
        return view
    }()
    
    override func loadView() {
        self.view = categoryView
    }
}
