//
//  UserProvider.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import Foundation
import FirebaseAuth

enum TypeOfUserDetail: String {
    case email = "email"
    case displayName = "displayName"
    case phoneNumber = "phoneNumber"
    case photoURL = "photoURL"
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (resut, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userModel.name
                changeRequest?.commitChanges { error in
                    if error == nil {
                        completionHandler(.success(userModel))
                    } else {
                        print(error?.localizedDescription ?? "")
                    }
                }
            }
        }
    }
    
    func checkUserLogged() -> Bool{
        return self.auth.currentUser != nil
    }
    
    func logout() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch let err {
            print(err)
            return false
        }
    }
    
    func getUserDetaisl() -> [TypeOfUserDetail: String] {
        var user = [TypeOfUserDetail: String]()
        if self.auth.currentUser != nil {
            user[.email] = self.auth.currentUser!.email
            user[.displayName] = self.auth.currentUser!.displayName
            user[.phoneNumber] = self.auth.currentUser!.phoneNumber
            user[.photoURL] = "\(String(describing: self.auth.currentUser!.photoURL))"
        }
        
        return user
    }
}
