//
//  LocationDetailViewController.swift
//  IvoryTowers
//
//  Created by Alison Rose Haugh on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var loactionAvgRating: UILabel!
    @IBOutlet weak var locationDesc: UILabel!
    @IBOutlet weak var locationReviews: UITableView!
    let cellIdentifier = "reviewCell";
    @IBOutlet weak var noReviews: UILabel!
    var reviews : [PFObject] = [];
    var objectId = ""
    var location : PFObject?;
    var ratings : [Int] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className:"Location")
        query.getObjectInBackgroundWithId(self.objectId) {
            (location: PFObject?, error: NSError?) -> Void in
            self.location = location;
            if error == nil && location != nil {
                self.locationName.text = location!["name"] as? String;
                self.locationDesc.text = location!["description"] as? String;
                if let url = NSURL(string: (location!["imageUrl"] as? String)!) {
                    if let data = NSData(contentsOfURL: url) {
                        self.locationImage.image = UIImage(data: data)
                    }
                }
                let reviewQuery = PFQuery(className:"Review")
                reviewQuery.whereKey("location", equalTo:(location)!)
                reviewQuery.findObjectsInBackgroundWithBlock {
                    (reviews: [PFObject]?, error: NSError?) -> Void in
                    if error == nil {
                        if reviews!.count == 0 {
                            self.locationReviews.hidden = true;
                        } else {
                            self.noReviews.hidden = true;
                            self.reviews = reviews!;
                            self.locationReviews.reloadData();
                            for review in reviews! {
                                self.ratings.append(review["rating"] as! Int)
                            }
                            var sum = 0;
                            for rating in self.ratings {
                                sum += rating;
                            }
                            let average = sum / self.ratings.count
                            self.loactionAvgRating.text = ("Rating - \(average)");
                        }
                    } else {
                        print(error)
                    }
                }
            } else {
                print(error)
            }
        }
        locationReviews.dataSource = self;
        locationReviews.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(locationReviews: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.reviews.count;
    }
    
    func tableView(locationReviews: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:LocationTableViewCell = locationReviews.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath : indexPath) as! LocationTableViewCell;
        
        let review = reviews[indexPath.row];
        var title = review["title"] as? String
        let rating = review["rating"] as? Int
        title = "\(title!) - \(rating!)"
        cell.reviewTitle?.text = title;
        cell.reviewText?.text = review["body"] as? String;
        cell.dateCreated?.text = review["createdAt"] as? String;
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createReview" {
            let controller = (segue.destinationViewController as! ReviewViewController)
                controller.location = self.objectId
                controller.locationObject = self.location;
        }
    }
    
    @IBAction func cancel(sender: UIStoryboardSegue) {
        return
    }
}
