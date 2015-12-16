//
//  ReviewViewController.swift
//  IvoryTowers
//
//  Created by iGuest on 12/10/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingPicker: UIPickerView!
    let ratings : [String] = ["1", "2", "3", "4", "5"];
    var review: Review?
    var location: String = "";
    var locationObject : PFObject?;
    var selectedRating : String = "";
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let review = review {
            navBar.title = review.title
            nameTextField.text = review.title
            descriptionTextField.text = review.body
        }
        
        nameTextField.delegate = self;
        descriptionTextField.delegate = self;
        //checkValidReviewName()
        self.ratingPicker.dataSource = self;
        self.ratingPicker.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true);
        return false;
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print(text);
        if (text == "\n") {
            textView.resignFirstResponder();
            return false;
        }
        return true;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.ratings.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ratings[row];
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selectedRating = ratings[row];
    }
    
    
    func checkValidReviewName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func save(sender: AnyObject?) {
        performSegueWithIdentifier("reviewSave", sender: sender)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "reviewSave" {
            let title = nameTextField.text
            let body = descriptionTextField.text
            let author = PFUser.currentUser()!
            let location = self.locationObject
            let rating = Int(self.selectedRating);
            let review = PFObject(className: "Review");
            review["title"] = title;
            review["body"] = body;
            review["author"] = author;
            review["location"] = location;
            review["rating"] = rating;
            review.saveInBackground()
            let controller = (segue.destinationViewController as! LocationDetailViewController)
            controller.location = self.locationObject;
            controller.objectId = self.locationObject!.valueForKey("objectId") as! String
        }
    }
}
