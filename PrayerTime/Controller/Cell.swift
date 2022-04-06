//
//  Cell.swift
//  PrayerTime
//
//  Created by Mavlon on 07/04/22.
//

import UIKit

protocol CellDelete {
    func deleteCell(index: IndexPath)
}

class Cell: UITableViewCell {

    @IBOutlet weak var factLbl: UILabel!
    var delegate: CellDelete?
    var index: IndexPath?

    func setCell(text: String) {
        factLbl.text = text
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        delegate?.deleteCell(index: index!)
    }
    
}
