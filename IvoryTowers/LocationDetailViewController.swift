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
    let mockDataTitles : [String] = ["Review 1", "Review 2", "Review 3", "Review 4", "Review 5", "Review 6"];
    let mockDataText : [String] = ["Text1", "Text 2", "Text3", "text4", "text5", "Text6"];
    
    var objectId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.objectId)
        locationReviews.dataSource = self
        locationReviews.delegate = self;
        locationName.text = "Test Location";
        locationDesc.text = "This is not a real location.";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(locationReviews: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.mockDataText.count;
    }
    
    func tableView(locationReviews: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:LocationTableViewCell = locationReviews.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath : indexPath) as! LocationTableViewCell;
        cell.reviewTitle?.text = mockDataTitles[indexPath.row];
        cell.reviewText?.text = mockDataText[indexPath.row];
        cell.dateCreated?.text = "Today";
        
        return cell;
    }
}
