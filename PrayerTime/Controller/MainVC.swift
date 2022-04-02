//
//  MainVC.swift
//  PrayerTime
//
//  Created by Mavlon on 01/04/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class MainVC: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var fajrTime: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var dhuhrTime: UILabel!
    @IBOutlet weak var asrTime: UILabel!
    @IBOutlet weak var maghribTime: UILabel!
    @IBOutlet weak var ishaaTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getPrayerTime(city: "Tashkent", country: "Uzbekistan")
    }


}

//MARK: - Get Times

extension MainVC {
    
    func getPrayerTime(city: String, country: String) {
        
        let url = "http://api.aladhan.com/v1/timingsByCity?"
        
        let params = [
            "city" : city,
            "country" : country,
            "method" : "13",
            "school" : "1"
        ]
        
        let request = AF.request(url, parameters: params)
        request.response { response in
            
            SwiftSpinner.show("Loading")
            
            if let data = response.data {
                
                let jsonData = JSON(data)
                self.cityNameLbl.text = jsonData["results"]["location"]["city"].stringValue
                self.dateLbl.text = jsonData["results"]["datetime"][0]["date"]["gregorian"].stringValue
                self.fajrTime.text = jsonData["results"]["datetime"][0]["times"]["Fajr"].stringValue
                self.sunriseTime.text = jsonData["results"]["datetime"][0]["times"]["Sunrise"].stringValue
                self.dhuhrTime.text = jsonData["results"]["datetime"][0]["times"]["Dhuhr"].stringValue
                self.asrTime.text = jsonData["results"]["datetime"][0]["times"]["Asr"].stringValue
                self.maghribTime.text = jsonData["results"]["datetime"][0]["times"]["Maghrib"].stringValue
                self.ishaaTime.text = jsonData["results"]["datetime"][0]["times"]["Isha"].stringValue
                
                SwiftSpinner.hide()
                
            } else {
                print("Response unsuccesful:", response.error.debugDescription)
                SwiftSpinner.hide()
            }
        }
        
    }
    
}
