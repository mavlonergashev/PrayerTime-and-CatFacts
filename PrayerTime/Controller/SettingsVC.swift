//
//  SettingsVC.swift
//  PrayerTime
//
//  Created by Mavlon on 01/04/22.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Facts about cats"
        navigationController?.navigationBar.tintColor = .orange
        
        let add = UIBarButtonItem(title: "+ Add Fact", style: .done, target: self, action: #selector(addAFact))
        navigationItem.leftBarButtonItem = add
        
        let more = UIBarButtonItem(title: "More Facts +", style: .done, target: self, action: #selector(addMoreFacts))
        navigationItem.rightBarButtonItem = more
        }
    
    @objc func addAFact() {
        
    }
    
    @objc func addMoreFacts() {
        
    }
    
}

//MARK: - Table View Methods

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        return cell
    }
    
}
