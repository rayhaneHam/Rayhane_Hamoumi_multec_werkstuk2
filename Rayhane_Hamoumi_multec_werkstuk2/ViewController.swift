//
//  ViewController.swift
//  Rayhane_Hamoumi_multec_werkstuk2
//
//  Created by Rayhane Hamoumi on 12/05/18.
//  Copyright © 2018 ehb.be. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

   
    @IBOutlet var NaamLanden: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func Dutch(_ sender: UIButton) {
        let Taal = Bundle.main.path(forResource: "nl", ofType: "lproj")
        let NL = Bundle.init(path: Taal!)! as Bundle
        NaamLanden.text = NL.localizedString(forKey: "CountryName", value: nil, table: nil)
    }
    @IBAction func English(_ sender: UIButton) {
        let Taal = Bundle.main.path(forResource: "en", ofType: "lproj")
        let Eng = Bundle.init(path: Taal!)! as Bundle
        NaamLanden.text = Eng.localizedString(forKey: "CountryName", value: nil, table: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


