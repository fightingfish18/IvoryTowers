//
//  LocationDetailViewController.swift
//  IvoryTowers
//
//  Created by Alison Rose Haugh on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var loactionAvgRating: UILabel!
    @IBOutlet weak var locationDesc: UILabel!
    @IBOutlet weak var locationReviews: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //For when new review to be added is sent back to location detail view controller
    @IBAction func unwindToReviewList(sender: UIStoryboardSegue) {
        //ADD FUNCTIONALITY
    }

}
