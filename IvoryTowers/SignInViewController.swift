//
//  SignInViewController.swift
//  IvoryTowers
//
//  Created by Alison Rose Haugh on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var signupName: UITextField!
    @IBOutlet weak var signupPass: UITextField!
    @IBOutlet weak var signupConfirm: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logIn(sender: AnyObject) {
    }
    
    @IBAction func signUp(sender: AnyObject) {
        if (signupName.text != nil) && (signupPass.text != nil) && (signupConfirm.text != nil) {
            if (signupPass.text == signupConfirm.text) {
                var user = PFUser()
                user.username = signupName.text
                user.password = signupPass.text
                user.signUpInBackgroundWithBlock{
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        let errorString = error.userInfo["error"] as? NSString
                        let alertController = UIAlertController(title: "User already exists", message: "That username is taken.", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alertController, animated: true, completion: nil)
                    } else {
                    // Hooray! Let them use the app now.
                    }
                }
            } else {
                let alertController = UIAlertController(title: "Mismatch", message: "Your password and password confirmation must match.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Blank Fields", message: "All three fields are required.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}