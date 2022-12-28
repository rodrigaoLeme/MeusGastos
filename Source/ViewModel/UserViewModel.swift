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
    
    func checkUserLogged() -> Bool {
        let manager = UserManager(business: UserBusiness())
        
        return manager.checkUserLogged()
    }
    
    func getUserDetails() -> [TypeOfUserDetail: String] {
        let manager = UserManager(business: UserBusiness())
        
        return manager.getUserDetails()
    }
}
