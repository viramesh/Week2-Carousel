//
//  SigninViewController.swift
//  Carousel
//
//  Created by viramesh on 2/12/15.
//  Copyright (c) 2015 vbits. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    
    @IBOutlet weak var loginFormGroup: UIView!
    @IBOutlet weak var signinBtnGroup: UIView!
    
    var loginFormOffset: CGFloat! = 80
    var loginFormGroupY: CGFloat!
    var signinBtnOffset: CGFloat! = 230
    var signinBtnGroupY: CGFloat!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    var invalidEmail: UIAlertView!
    var invalidPassword: UIAlertView!
    var invalidLogin: UIAlertView!
    var loginDelay: UIAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        loginFormGroupY = loginFormGroup.center.y
        signinBtnGroupY = signinBtnGroup.center.y
        
        
        invalidEmail = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
        invalidPassword = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
        invalidLogin = UIAlertView(title: "Incorrect Email/Password", message: "Please check your email and password and try again", delegate: self, cancelButtonTitle: "OK")
        loginDelay = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
            self.loginFormGroup.center.y = self.loginFormGroupY - self.loginFormOffset
            self.signinBtnGroup.center.y = self.signinBtnGroupY - self.signinBtnOffset

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
            self.loginFormGroup.center.y = self.loginFormGroupY
            self.signinBtnGroup.center.y = self.signinBtnGroupY
            
            }, completion: nil)
    }
    
    func checkPassword() {
        loginDelay.dismissWithClickedButtonIndex(0, animated: true)
        if(loginPassword.text != "password") {
            invalidLogin.show()
        }
        else {
            // perform segue into next section
        }
    }
    
    @IBAction func signinButtonDidPress(sender: AnyObject) {
        if(loginEmail.text.isEmpty) {
            invalidEmail.show();
        }
        else if(loginPassword.text.isEmpty) {
            invalidPassword.show()
        }
        else {
            loginDelay.show()
            delay(2) {
                self.checkPassword()
            }
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
