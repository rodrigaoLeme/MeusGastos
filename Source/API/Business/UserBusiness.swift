//
//  UserBusiness.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 20/12/22.
//

import Foundation

class UserBusiness: UserBusinessProtocol {
    
    let provider: UserProvider = UserProvider()
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.login(parameters: getParams(email, password)) { result in
            switch result {
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func register(name: String, email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.register(parameters: getRegisterParams(name, email, password)) { result in
            switch result {
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func registerFacebook(completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        provider.registerFacebook { result in
            switch result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }



    private func getParams(_ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel: userModel]]
        
        return params
    }
    
    private func getRegisterParams(_ name: String, _ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(name: name, email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel: userModel]]
        
        return params
    }
    
    func checkUserLogged() -> Bool {
        return provider.checkUserLogged()
    }
    
    func logout() -> Bool {
        return provider.logout()
    }
    
    func getUserDetails() -> [TypeOfUserDetail: String] {
        return provider.getUserDetaisl()
    }
    
    func resendPassword(email: String, completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        provider.resendPassword(email: email) { result in
            switch result {
            case .success(let ret):
                completionHandler(.success(ret))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
