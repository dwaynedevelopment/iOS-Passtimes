//
//  ViewController.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import MaterialComponents

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailEditText: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordEditText: SkyFloatingLabelTextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Round corners for buttons, helper class.
        
        ButtonUtils.roundedButtonMapper(button: logInButton)
        if (AuthUtils.isUserCurrentlySignedIn()) {
            if (AuthUtils.getCurrentSignedUser() != nil) {
                SnackbarUtils.invokeSnackbar(message: AuthUtils.getCurrentSignedUser().getName + " is currently signed in.")
                performSegue(withIdentifier: "toFeed", sender: self)
            }
        } else {
            
        }

    }
    
    @IBAction func loginEventListener(_ sender: UIButton) {
        
        if let email = emailEditText.text, let password = passwordEditText.text {
            if AuthUtils.isEmailValid(email: email){
                AuthUtils.authenticateSignInEmailAndPassword(email: email, password: password)
                  performSegue(withIdentifier: "toFeed", sender: self)
            } else {
                SnackbarUtils.invokeSnackbar(message: "One or more fields are incorrect.")
            }
        
        }
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FeedViewController {

        }
    }
    
}
