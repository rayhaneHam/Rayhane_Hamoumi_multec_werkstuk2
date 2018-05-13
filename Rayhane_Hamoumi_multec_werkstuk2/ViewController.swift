//
//  ViewController.swift
//  Rayhane_Hamoumi_multec_werkstuk2
//
//  Created by Rayhane Hamoumi on 12/05/18.
//  Copyright © 2018 ehb.be. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct VilloStation:Decodable {
    let number: Int
    let name: String
    let position: LocatieStation?
}

struct LocatieStation:Decodable{
    let lat: Double
    let lng: Double
}

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var Locatie = CLLocationManager()

   
    
    @IBOutlet weak var RefreshTime: UILabel!
    @IBOutlet var NaamLanden: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Locatie.delegate = self
        Locatie.requestWhenInUseAuthorization()
        Locatie.startUpdatingLocation()
        
        let url = "https://api.jcdecaux.com/vls/v1/stations?apiKey=6d5071ed0d0b3b68462ad73df43fd9e5479b03d6&contract=Bruxelles-Capitale"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            do{
                let Villobxl = try JSONDecoder().decode([VilloStation].self, from: data!)
                
                for villo in Villobxl {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: (villo.position?.lat)!, longitude: (villo.position?.lng)!)
                    annotation.title = villo.name
                    annotation.subtitle = villo.name
                    
                    self.mapView.addAnnotation(annotation)
                }
            } catch{
                print("Shit Error")
            }
            }.resume()
        RefreshPagina()
    }
    
    func RefreshPagina() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        RefreshTime.text = "Refresh voor het huidige uur: \(hour):\(minutes)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.20, longitudeDelta: 0.20)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
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



