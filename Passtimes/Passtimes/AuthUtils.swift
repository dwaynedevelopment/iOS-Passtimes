//
//  AuthUtils.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthUtils {
    
    public static func authenticateSignInEmailAndPassword(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if (error == nil) {
                guard user != nil else { return }
                let player = getCurrentSignedUser()
            } else {
                SnackbarUtils.invokeSnackbar(message: error!.localizedDescription)
            }
        }
    }
    
    public static func getCurrentSignedUser() -> Player {
        return Player(id: Auth.auth().currentUser?.uid ?? "uuid", name: Auth.auth().currentUser?.displayName ?? "default", thumbnail: Auth.auth().currentUser?.photoURL?.absoluteString ?? "thumbnailUrl")
    }
    
    public static func isUserCurrentlySignedIn() -> Bool {
        if Auth.auth().currentUser?.uid != nil {
            return true
        } else {
             SnackbarUtils.invokeSnackbar(message: "There is no user currently signed in.")
            return false
        }
    }
    
    // at least one uppercase,
    // at least one digit
    // at least one lowercase
    // 8 characters total
    public static func isValidPassword(password: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return predicate.evaluate(with: password)
    }
    
    public static func isEmailValid(email: String) -> Bool { 
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
}
