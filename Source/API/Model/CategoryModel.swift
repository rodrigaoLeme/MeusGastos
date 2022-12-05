//
//  CategoryModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 01/12/22.
//

import Foundation

typealias CategoriesModel = [CategoryModel]

struct CategoryModel: Codable {
    let id: Int?
    let name: String?
    let about: String?
    let uid: String?
    
    init() {
        self.init(id: 0, name: .empty, about: .empty, uid: .empty)
    }
    
    init(id: Int, name: String, about: String, uid: String) {
        self.id = id
        self.name = name
        self.about = about
        self.uid = uid
    }
}
