//
//  LancamentosTableViewController.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 04/12/22.
//

import Foundation
import UIKit

class LancamentosTableViewController: UITableViewController {
    private lazy var tableV: LancamentosTableView = {
        let view = LancamentosTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    override func loadView() {
        self.view = tableV
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableV.separatorStyle = .singleLine
        tableV.allowsSelection = false
        tableV.contentInsetAdjustmentBehavior = .never
    }
}
