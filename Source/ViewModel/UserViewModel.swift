//
//  UserViewModel.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 21/12/22.
//

import Foundation

class UserViewModel {
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromApi(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    func setUserFromApi(_ name: String, _ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(name: name, email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    func registerFacebook(completionHandler: @escaping(Result<Bool, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.registerFacebook { result in
            switch result {
            case .success(_):
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func checkUserLogged() -> Bool {
        let manager = UserManager(business: UserBusiness())
        
        return manager.checkUserLogged()
    }
    
    func logout() -> Bool {
        let manager = UserManager(business: UserBusiness())
        
        return manager.logout()
    }
    
    func getUserDetails() -> [TypeOfUserDetail: String] {
        let manager = UserManager(business: UserBusiness())
        
        return manager.getUserDetails()
    }
    
    func resendPassword(_ email: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.resendPassword(email: email) { ret in
            completion(.success(ret))
        } failureHandler: { error in
            completion(.failure(error))
        }

    }
}
