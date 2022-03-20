//
//  UserPresenter.swift
//  MVP_Example
//
//  Created by Sezgin Çiftci on 10.03.2022.
//

import UIKit

protocol PresentUsersDelegate: AnyObject {
    func presentUsers(_ user: MainModel)
    func displayAlert(_ message: String)
}

//typealias PresenterDelegate = PresentUsersDelegate & UIViewController

class UserPresenter {
    
    weak var presentDelegate: PresentUsersDelegate?
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    
    func fetchJsonData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data, error == nil else {
                self?.presentDelegate?.displayAlert("Domain Error!")
                print("domain error")
                return
            }
            
            let result = try? JSONDecoder().decode(MainModel.self, from: data)
            if let result = result {
                self?.presentDelegate?.presentUsers(result)
            } else {
                self?.presentDelegate?.displayAlert("Decoding Error!")
                print("decoding error")
            }
            
            guard let response = response as? HTTPURLResponse  else {
                self?.presentDelegate?.displayAlert("Response Alert!")
                print("response error")
                return
            }
            print("Response status code: \(response.statusCode)")
            
        }.resume()
    }
    
    private func setDelegate(delegate: PresentUsersDelegate) {
        self.presentDelegate = delegate
    }
}


