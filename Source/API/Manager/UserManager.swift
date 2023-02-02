//
//  UserManager.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 20/12/22.
//

import Foundation
import GoogleSignIn

class UserManager: UserManagerProtocol {
    
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func login(email: String, password: String, successHandler: @escaping (UserModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(name: String, email: String, password: String, successHandler: @escaping (UserModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        business.register(name: name, email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func registerFacebook(completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        business.registerFacebook { result in
            switch result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func registerGoogle(signResult: GIDSignInResult, completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        business.registerGoogle(signResult: signResult) { result in
            switch result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func checkUserLogged() -> Bool {
        return business.checkUserLogged()
    }
    
    func logout() -> Bool {
        return business.logout()
    }
    
    func getUserDetails() -> [TypeOfUserDetail: String] {
        return business.getUserDetails()
    }
    
    func resendPassword(email: String, successHandler: @escaping (Bool) -> Void, failureHandler: @escaping (Error) -> Void) {
        business.resendPassword(email: email) { result in
            switch result {
            case .success(let ret):
                successHandler(ret)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
}
