//
//  Constants.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

//class Constants: UIView {
//    static func screenWidth() -> CGFloat {
//        return UIScreen.main.bounds.width
//    }
//
//    static func screenHeight() -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
//}

struct Constants {
    struct ScreenSizes {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
    }
    
    struct ParametersKeys {
        static let body = "body"
        static let userModel = "userModel"
    }
    
    struct UserDetails {
        let userViewModel = UserViewModel()
        
        
    }
}
