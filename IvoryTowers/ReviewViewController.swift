//
//  ReviewViewController.swift
//  IvoryTowers
//
//  Created by iGuest on 12/10/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    var review: Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let review = review {
            navBar.title = review.title
            nameTextField.text = review.title
            descriptionTextField.text = review.body
            ratingControl.rating = review.rating
        }
        
        checkValidReviewName()
    }
    
    
    func checkValidReviewName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        //NEED TO ADD CANCEL
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = nameTextField.text ?? ""
            let rating = ratingControl.rating
            let body = descriptionTextField.text ?? ""
            let author = "" //NEED TO GET
            let location = "" //NEED TO GET
            
            review = Review(author: author, location: location, title: title, body: body, rating: rating)
        }
    }

}
