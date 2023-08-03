//
//  ViewController.swift
//  MVP_Example
//
//  Created by Sezgin Çiftci on 10.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PresentUsersDelegate, ChangeViewColorDelegate {
    
    var listTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        return table
    }()
    
    var newPresenter = UserPresenter()
    var mainModel = MainModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        listTableView.delegate = self
        listTableView.dataSource = self
        newPresenter.presentDelegate = self
        
        configureUI()
        loadData()
    }


    
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
        
    private func loadData() {
        DispatchQueue.main.async {
            self.newPresenter.fetchJsonData()
        }
        
    }
    
    private func configureUI() {
        
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "OUR USERS LIST"
        
        view.addSubview(listTableView)
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func presentUsers(_ user: MainModel) {
        self.mainModel = user
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = mainModel[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailVC()
        vc.colorDelegate = self
        
        vc.title = mainModel[indexPath.row].name
        DataToPass.userName = mainModel[indexPath.row].username
        DataToPass.email = mainModel[indexPath.row].email
        DataToPass.phone = mainModel[indexPath.row].phone
        DataToPass.adressCity = mainModel[indexPath.row].address.city
        DataToPass.website = mainModel[indexPath.row].website
        DataToPass.companyName = mainModel[indexPath.row].company.name
        
        present(transition(vc), animated: true, completion: nil)
    }
    
    func transition(_ vc: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalTransitionStyle = .crossDissolve
        navVC.modalPresentationStyle = .fullScreen
        return navVC
    }
    
}



