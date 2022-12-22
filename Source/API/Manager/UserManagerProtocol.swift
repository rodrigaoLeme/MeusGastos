//
//  UserManagerProtocol.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 20/12/22.
//

import Foundation

protocol UserManagerProtocol {
    func login(email: String, password: String,
               successHandler: @escaping(UserModel) -> Void,
               failureHandler: @escaping(Error) -> Void)
    
    func register(name: String, email: String, password: String,
                  successHandler: @escaping(UserModel) -> Void,
                  failureHandler: @escaping(Error) -> Void)
}
