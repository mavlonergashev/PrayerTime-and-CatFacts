//
//  SettingsVC.swift
//  PrayerTime
//
//  Created by Mavlon on 01/04/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class SettingsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }
    
    var dataFacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        }
    
    @objc func addAFact() {
        getFacts(count: 1)
    }
    
    @objc func addMoreFacts() {
        getCount()
    }
    
}

//MARK: - Table View Methods

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.setCell(text: dataFacts[indexPath.row])
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
}

//MARK: - Set Nav Bar

extension SettingsVC {
    func setNavBar() {
        title = "Facts about cats"
        navigationController?.navigationBar.tintColor = .orange
        let add = UIBarButtonItem(title: "+ Add Fact", style: .done, target: self, action: #selector(addAFact))
        navigationItem.leftBarButtonItem = add
        let more = UIBarButtonItem(title: "More Facts +", style: .done, target: self, action: #selector(addMoreFacts))
        navigationItem.rightBarButtonItem = more
    }
}

//MARK: - DeleteCell Protocol

extension SettingsVC: CellDelete {
    func deleteCell(index: IndexPath) {
        self.dataFacts.remove(at: index.row)
        self.tableView.deleteRows(at: [index], with: .top)
        self.tableView.reloadData()
    }
}

//MARK: - API Get Facts

extension SettingsVC {
    func getFacts(count: Int) {
        let url = "https://catfact.ninja/fact"
        SwiftSpinner.show("Loading...")
        for _ in 0..<count {
            let request = AF.request(url)
            request.response { response in
                if let data = response.data {
                    let jsonData = JSON(data)
                    let newText = jsonData["fact"].stringValue
                    self.dataFacts.append(newText)
                    self.tableView.reloadData()
                } else {
                    print("Error with Response,", response.error.debugDescription)
                }
            }
        }
        SwiftSpinner.hide()
    }
}

//MARK: - Getting count with AlertVC

extension SettingsVC {
    func getCount() {
        let alertVC = UIAlertController(title: "How many facts do you want to add?", message: "Insert only numbers:", preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "Count"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            // print("Add tapped")
            if let count = alertVC.textFields?.first?.text {
                self.getFacts(count: Int(count) ?? 0)
            }
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            // print("Cancel tapped")
        }
        alertVC.addAction(addAction)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
}

//MARK: - ShowAlert

extension SettingsVC {
    func showAlert(text: String) {
        let alertVC = UIAlertController(title: "Warning", message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            // print("Ok tapped")
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
