//
//  ButtonSocialMedias.swift
//  MeusGastos
//
//  Created by IATec - Rodrigo Leme on 14/12/22.
//

import UIKit

enum TypeSocialMedia {
    case facebook
    case google
}

class ButtonSocialMedias: UIButton {
    init(typeSocialMedia: TypeSocialMedia) {
        super.init(frame: .zero)
        
        initDefault(typeSocialMedia: typeSocialMedia)
    }
    
    private func initDefault(typeSocialMedia: TypeSocialMedia) {        
        switch (typeSocialMedia) {
        case .facebook:
            facebookButton()
            break
        case .google:
            googleButton()
            break
        }
    }
    
    private func facebookButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.setTitle("Login com facebook", for: .normal)
        self.setAttributedTitle(AttributedTextwithImageSuffix(AttributeImage: #imageLiteral(resourceName: "logo-facebook"), AttributedText: "Login com", buttonBound: self), for: .normal)
        
        self.setTitleColor(.facebookTextColor, for: .normal)
        self.layer.cornerRadius = 25
        self.backgroundColor = .facebookBackgroundColor
    }
    
    private func googleButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.setTitle("Login com Google", for: .normal)
        self.setAttributedTitle(AttributedTextwithImageSuffix(AttributeImage: #imageLiteral(resourceName: "logo-google"), AttributedText: "Login com ", buttonBound: self, x: 0, y: -4, width: 20, height: 20), for: .normal)
        
        self.setTitleColor(.googleTextColor, for: .normal)
        self.layer.cornerRadius = 25
        self.backgroundColor = .googleBackgroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.googleBorderColor.cgColor
    }
    
    func AttributedTextwithImageSuffix(AttributeImage : UIImage , AttributedText : String , buttonBound : UIButton , x : Int = 0 , y : Int = -8 , width : Int = 30 , height : Int = 30) -> NSMutableAttributedString
    {
        let fullString = NSMutableAttributedString(string: AttributedText + " ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.bounds = CGRect(x: x, y: y, width: width, height: height)
        image1Attachment.image = AttributeImage
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: ""))
        return fullString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
