//
//  Constants.swift
//  MVP_Example
//
//  Created by Sezgin Çiftci on 10.03.2022.
//

import UIKit

class DataToPass {
    
    static var userName: String?
    static var email: String?
    static var adressCity: String?
    static var phone: String?
    static var website: String?
    static var companyName: String?

}

class MakeProperty {
    
    static func makeLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemTeal
        label.textAlignment = .center
        label.textColor = .black
        label.text = title
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    
    static func makeButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }
    
}

