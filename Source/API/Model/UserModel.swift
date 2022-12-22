//
//  UserModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import Foundation

struct UserModel: Codable {
    let name: String?
    let email: String
    let password: String
    
    init() {
        self.name = String()
        self.email = String()
        self.password = String()
    }
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    init(email: String, password: String) {
        self.name = String()
        self.email = email
        self.password = password
    }
}
