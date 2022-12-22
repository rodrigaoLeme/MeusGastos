//
//  UserBusinessProtocol.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 20/12/22.
//

import Foundation

protocol UserBusinessProtocol {
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(name: String, email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}
