//
//  FirstViewController.swift
//  IvoryTowers
//
//  Created by Cechi Shi on 12/3/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController, GMSMapViewDelegate {
    // var query : String?
    var locations : [PFObject] = [];
    var selectedText : String = "";

    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ***Google Maps setup***
        let camera = GMSCameraPosition.cameraWithLatitude(47.653, longitude:-122.306, zoom:15)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.delegate = self;
        self.view = mapView
        let query = PFQuery(className: "Location");
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in

            if error == nil {
                if let objects = objects {
                    self.locations = objects;
                    for object in objects {
                        let coordinates = object["coordinates"];
                        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude));
                        marker.title = object["name"]! as! String;
                        marker.snippet = object["description"]! as! String;
                        marker.map = mapView;
                    }
                }
            } else {
                
            }
        }
        
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        self.selectedText = marker.title;
        performSegueWithIdentifier("buildingLocationDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "buildingLocationDetail" {
            let controller = (segue.destinationViewController as! LocationDetailViewController)
            for location in locations {
                if location["name"] as! String == self.selectedText {
                    controller.objectId = location.valueForKey("objectId") as! String;
                }
            }
        }
    }


}

