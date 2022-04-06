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
    
    var dataFacts: [String] = ["Cats are friend for people"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()

        }
    
    @objc func addAFact() {
        
    }
    
    @objc func addMoreFacts() {
        
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
        cell.index = indexPath.row
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
    
    func deleteCell(index: Int) {
        self.dataFacts.remove(at: index)
        self.tableView.reloadData()
    }
    
}

//MARK: - API Get Facts

extension SettingsVC {
    
    func getFacts(count: Int) {
        
    }
    
}
