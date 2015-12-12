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
    
    var reviews = [Review]()    //Main Arrays of reviews to be populated in loadReviews() function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadReviews()
    }
    
    //Load reviews from Parse
    func loadReviews() {
        //TODO: LOAD REVIEWS
    }
    
    //For when new review to be added is sent back to location detail view controller
    @IBAction func unwindToReviewList(sender: UIStoryboardSegue) {
        //ADD FUNCTIONALITY
        
        if let sourceViewController = sender.sourceViewController as? ReviewViewController, review = sourceViewController.review {
            
            //If review does not exist in Parse, save new review
            
            //TODO: Save review object into Parse
            //TODO: Reload page, or add object to tableView
            
            
            //Else update review
            
        }
    }

}
