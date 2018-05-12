//
//  ViloStation.swift
//  Rayhane_Hamoumi_multec_werkstuk2
//
//  Created by Rayhane Hamoumi on 12/05/18.
//  Copyright © 2018 ehb.be. All rights reserved.
//

import Foundation
import MapKit

class ViloStation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
