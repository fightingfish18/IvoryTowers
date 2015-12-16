//
//  ProfileViewController.swift
//  IvoryTowers
//
//  Created by Cechi Shi on 12/3/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var username: UILabel!

    var reviews : [PFObject]?

    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = PFUser.currentUser()?.username
        print(reviews)
        print("abbacadabra")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let review = reviews![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("reviewCell") as! ReviewCell
        cell.body.text = String(review["body"])
        cell.score.text = String(review["score"])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (reviews?.count)!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
