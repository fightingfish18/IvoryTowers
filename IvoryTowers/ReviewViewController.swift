//
//  ReviewViewController.swift
//  IvoryTowers
//
//  Created by iGuest on 12/10/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingPicker: UIPickerView!
    let ratings : [String] = ["1", "2", "3", "4", "5"];
    var review: Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let review = review {
            navBar.title = review.title
            nameTextField.text = review.title
            descriptionTextField.text = review.body
        }
        
        checkValidReviewName()
        self.ratingPicker.dataSource = self;
        self.ratingPicker.delegate = self;
    }
    
    
    func checkValidReviewName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.ratings.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return ratings[row];
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
            let body = descriptionTextField.text ?? ""
            let author = "" //NEED TO GET
            let location = "" //NEED TO GET
            
            //review = Review(author: author, location: location, title: title, body: body, rating: rating)
        }
    }

}
