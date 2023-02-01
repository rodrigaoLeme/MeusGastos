//
//  UserProvider.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 19/12/22.
//

import Foundation
import FirebaseAuth
import FacebookLogin

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
    
    func registerFacebook(completionHandler: @escaping (Result<Bool, Error>) -> Void) {
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: [.email, .publicProfile], viewController: nil) { result in
            switch result {
            case .success(granted: _, declined: _, token: let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                self.auth.languageCode = "pt-br"
                self.auth.signIn(with: credential) { result, error in
                    if let error = error {
                        completionHandler(.failure(error))
                    } else {
                        completionHandler(.success(true))
                    }
                }
            case .cancelled:
                break
            case .failed(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func resendPassword(email: String, completionHandler: @escaping(Result<Bool, Error>) -> Void) {
        self.auth.languageCode = "pt-br"
        self.auth.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(true))
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
