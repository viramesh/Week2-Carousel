//
//  CreateViewController.swift
//  Carousel
//
//  Created by viramesh on 2/15/15.
//  Copyright (c) 2015 vbits. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createFormGroup: UIView!
    @IBOutlet weak var createBtnGroup: UIView!
    
    var createFormGroupOffset: CGFloat! = 80
    var createFormGroupY: CGFloat!
    var createBtnGroupOffset: CGFloat! = 230
    var createBtnGroupY: CGFloat!
    
    @IBOutlet weak var formName: UITextField!
    @IBOutlet weak var formEmail: UITextField!
    @IBOutlet weak var formPassword: UITextField!
    @IBOutlet weak var termsSwitch: UISwitch!
    
    var invalidFormEntry: UIAlertView!
    var termsNotAccepted: UIAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        createFormGroupY = createFormGroup.center.y
        createBtnGroupY = createBtnGroup.center.y
        
        termsSwitch.on = false
        
        invalidFormEntry = UIAlertView(title: "All Fields Required", message: "Please fill out all fields to create an account", delegate: self, cancelButtonTitle: "OK")
        termsNotAccepted = UIAlertView(title: "Agree to terms", message: "You must agree to terms to create an account", delegate: self, cancelButtonTitle: "OK")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnDidPress(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            self.createFormGroup.center.y = self.createFormGroupY - self.createFormGroupOffset
            self.createBtnGroup.center.y = self.createBtnGroupY - self.createBtnGroupOffset
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            self.createFormGroup.center.y = self.createFormGroupY
            self.createBtnGroup.center.y = self.createBtnGroupY
            
            }, completion: nil)
    }

    @IBAction func createBtnDidPress(sender: AnyObject) {
        
        if(formName.text.isEmpty || formEmail.text.isEmpty || formPassword.text.isEmpty) {
            invalidFormEntry.show()
        }
        else if(!termsSwitch.on) {
            termsNotAccepted.show()
        }
        else {
            performSegueWithIdentifier("createAccountSegue", sender: self)
        }
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
