//
//  FirstViewController.swift
//  IvoryTowers
//
//  Created by Cechi Shi on 12/3/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit
// import GoogleMaps
import MapKit

class MapViewController: UIViewController {
    // var query : String?

    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ***Google Maps setup***
        // let camera = GMSCameraPosition.cameraWithLatitude(*Latitude as float*, longitude:*Longitude as float*, zoom:*Int*)
        // let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        // self.view = mapView
    }


}

