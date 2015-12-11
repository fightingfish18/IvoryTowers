//
//  ReviewViewController.swift
//  IvoryTowers
//
//  Created by iGuest on 12/10/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var review: Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If passed a review object, set properties for editting
        if let review = review {
            navBar.title = review.title
            nameTextField.text = review.title
            descriptionTextField.text = review.body
            ratingControl.rating = review.rating
        }
        
        //checkValidReviewName() //Only for editting functionality
    }
    
    //Check if name passed was valid to allow for editing
    func checkValidReviewName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    //If cancel button clicked
    @IBAction func cancel(sender: UIBarButtonItem) {
        //NEED CANCEL
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Prepare review object to send back to location detail view controller if save button is clicked
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = nameTextField.text ?? ""
            let rating = ratingControl.rating
            let body = descriptionTextField.text ?? ""
            let author = "" //NEED TO GET FROM PARSE
            let location = "" //NEED TO GET FROM SOMEWHERE
            
            //New review object
            review = Review(author: author, location: location, title: title, body: body, rating: rating)
        }
    }
}
