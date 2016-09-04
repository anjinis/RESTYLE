//
//  ViewController.swift
//  restyle
//
//  Created by anjini shukla on 11/7/15.
//  Copyright (c) 2015 anjini shukla. All rights reserved.
//

import UIKit
import Foundation
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate
{
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        //PFUser.logOut()
        
        if (PFUser.currentUser() == nil)
        {
            print("NO USER")
            
            
            self.logInViewController.fields = [PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.PasswordForgotten ]
         
            let logInLogoTitle = UILabel()
            logInLogoTitle.text = "RESTYLE"
        
           print("hello")
           // print (logInLogoTitle.text)
            
            //self.logInViewController.logInView?.logo =
            self.logInViewController.logInView?.logo = logInLogoTitle
            
            self.logInViewController.delegate = self
            
            let SignUpLogoTitle = UILabel()
            SignUpLogoTitle.text = "RESTYLE"
            
            self.signUpViewController.signUpView?.logo = SignUpLogoTitle
            
            self.signUpViewController.delegate = self
            
            self.logInViewController.signUpController = self.signUpViewController
            
            self.presentViewController(self.logInViewController, animated: true, completion: nil)
            
        }
        else
        {            
            let storyboard = UIStoryboard(name: "FeedViewController", bundle: nil)
            
            let feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
            
            self.presentViewController(feedViewController, animated: true, completion: nil)
        }
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Parse Login
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        
        
        if (!username.isEmpty || !password.isEmpty) {
            return true
        }else {
            return false
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError!)
    {
        print("Failed to login...")
    }
    
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController!) {
        
    }
    
    // MARK: Parse Signup
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!)
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        
        print("FAiled to sign up...")
        
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController!)
    {
        
        print("User dismissed sign up.")
        
    }
    
    // MARK: Actions

    @IBAction func Welcome(sender: AnyObject)
    {
     print("hello")
        
    }

}

