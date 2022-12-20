//
//  UserProviderProtocol.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import Foundation

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}
