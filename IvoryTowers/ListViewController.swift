//
//  ListViewController.swift
//  IvoryTowers
//
//  Created by Alison Rose Haugh on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UISearchResultsUpdating {
    var objectIds = [String]()
    var locations = [String]()
    var filteredLocations = [String]()
    var resultSearchController = UISearchController()
    var locationObjects : [PFObject] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Location")
        query.findObjectsInBackgroundWithBlock {
            (locations: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // Do something with the found objects
                if let locations = locations {
                    self.locationObjects = locations;
                    for location in locations {
                        let name = location["name"] as! String
                        let abbr = location["abbreviation"] as! String
                        self.locations.append("\(name) \(abbr=="none" ? "" : "(\(abbr))")")
                        self.objectIds.append(location.objectId!)
                    }
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredLocations.count
        } else {
            return self.locations.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell?
        
        if (self.resultSearchController.active) {
            cell!.textLabel?.text = self.filteredLocations[indexPath.row]
            return cell!
        } else {
            cell!.textLabel?.text = self.locations[indexPath.row]
            return cell!
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredLocations.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.locations as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredLocations = array as! [String]
        self.tableView.reloadData()
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        return
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let id = self.objectIds[indexPath.row]
                let controller = (segue.destinationViewController as! LocationDetailViewController)
                controller.objectId = id
                controller.location = self.locationObjects[indexPath.row]
            }
        }
    }
}

