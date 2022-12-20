//
//  UserModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
