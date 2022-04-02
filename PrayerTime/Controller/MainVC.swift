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
                self.cityNameLbl.text =  "Tashkent" //jsonData["data"]["location"]["city"].stringValue
                self.dateLbl.text = jsonData["data"]["date"]["readable"].stringValue
                self.fajrTime.text = jsonData["data"]["timings"]["Fajr"].stringValue
                self.sunriseTime.text = jsonData["data"]["timings"]["Sunrise"].stringValue
                self.dhuhrTime.text = jsonData["data"]["timings"]["Dhuhr"].stringValue
                self.asrTime.text = jsonData["data"]["timings"]["Asr"].stringValue
                self.maghribTime.text = jsonData["data"]["timings"]["Maghrib"].stringValue
                self.ishaaTime.text = jsonData["data"]["timings"]["Isha"].stringValue
                
                SwiftSpinner.hide()
                
            } else {
                print("Response unsuccesful:", response.error.debugDescription)
                SwiftSpinner.hide()
            }
        }
        
    }
    
}
