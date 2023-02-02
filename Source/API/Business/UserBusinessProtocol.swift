//
//  UserBusinessProtocol.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 20/12/22.
//

import Foundation
import GoogleSignIn

protocol UserBusinessProtocol {
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(name: String, email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func registerFacebook(completionHandler: @escaping (Result<Bool, Error>) -> Void)
    func registerGoogle(signResult: GIDSignInResult, completionHandler: @escaping (Result<Bool, Error>) -> Void)
    func checkUserLogged() -> Bool
    func logout() -> Bool
    func getUserDetails() -> [TypeOfUserDetail: String]
    func resendPassword(email: String, completionHandler: @escaping(Result<Bool, Error>) -> Void)
}
