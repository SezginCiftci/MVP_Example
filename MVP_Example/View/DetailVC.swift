//
//  DetailVC.swift
//  MVP_Example
//
//  Created by Sezgin Çiftci on 10.03.2022.
//

import UIKit

protocol ChangeViewColorDelegate: AnyObject {
    func changeColor(_ color: UIColor)
}


class DetailVC: UIViewController {
    
    
    weak var colorDelegate: ChangeViewColorDelegate?
    
    private var upView = UIView()
    private var userImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congifureDetail()
    }
    
    private func congifureDetail() {
        
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(backToMainVC))
        
        
        
        view.addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),

            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 200),
            userImage.widthAnchor.constraint(equalToConstant: 200)
        ])
        userImage.image = UIImage(named: "user")
        userImage.sizeToFit()
        userImage.contentMode = .scaleAspectFit
        userImage.layer.cornerRadius = 100

        
        view.addSubview(upView)
        upView.translatesAutoresizingMaskIntoConstraints = false
        upView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20).isActive = true
        upView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        upView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        upView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        upView.backgroundColor = .white
        upView.layer.cornerRadius = 30

        let userName = MakeProperty.makeLabel("User name is: \(DataToPass.userName ?? "No Name")")
        upView.addSubview(userName)
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: upView.topAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            userName.heightAnchor.constraint(equalToConstant: 40)
        ])
                
        let email = MakeProperty.makeLabel("User e-mail is: \(DataToPass.email ?? "No Email")")
        upView.addSubview(email)
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            email.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            email.heightAnchor.constraint(equalToConstant: 40)
        ])

        let adressCity = MakeProperty.makeLabel("User adress is: \(DataToPass.adressCity ?? "No Email")")
        upView.addSubview(adressCity)
        NSLayoutConstraint.activate([
            adressCity.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
            adressCity.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            adressCity.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            adressCity.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let phone = MakeProperty.makeLabel("User's phone is: \(DataToPass.phone ?? "No Email")")
        upView.addSubview(phone)
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: adressCity.bottomAnchor, constant: 20),
            phone.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            phone.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            phone.heightAnchor.constraint(equalToConstant: 40)
        ])

        let website = MakeProperty.makeLabel("User's website is: \(DataToPass.website ?? "No Email")")
        upView.addSubview(website)
        NSLayoutConstraint.activate([
            website.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 20),
            website.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            website.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            website.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let companyName = MakeProperty.makeLabel("User's company is: \(DataToPass.companyName ?? "No Email")")
        upView.addSubview(companyName)
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: website.bottomAnchor, constant: 20),
            companyName.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 20),
            companyName.trailingAnchor.constraint(equalTo: upView.trailingAnchor, constant: -20),
            companyName.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let congratsButton = MakeProperty.makeButton("Congrats!!!")
        view.addSubview(congratsButton)
        NSLayoutConstraint.activate([
            congratsButton.topAnchor.constraint(equalTo: upView.bottomAnchor, constant: 20),
            congratsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            congratsButton.heightAnchor.constraint(equalToConstant: 40),
            congratsButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        congratsButton.addTarget(self, action: #selector(congrats), for: .touchUpInside)
    }
    
    @objc func congrats() {
        //self.colorDelegate?.printSmt("yazıyorrrrrrr")
        self.colorDelegate?.changeColor(.red)
    }
    
    private func setDelegate(delegate: ChangeViewColorDelegate) {
        self.colorDelegate = delegate
    }
    
    @objc private func backToMainVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
