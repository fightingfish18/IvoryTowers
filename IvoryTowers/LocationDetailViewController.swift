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
            
            /*
            Sample Code:
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing review
                
                //Parse
                
                reviews[selectedIndexPath.row] = review
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new review
                
                //Parse
                
                let newIndexPath = NSIndexPath(forRow: reviews.count, inSection: 0)
                reviews.append(review)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            */
            
                   
        }
    }
}
