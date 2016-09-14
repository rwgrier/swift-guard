//  Swift Guard Post
//
//  Created by Ryan Grier on 03/06/16.
//  Copyright © 2016 Ryan Grier All rights reserved.

import UIKit

enum ValidationResults {
    case valid, usernameExists, invalidUsername, invalidPassword, notValidated
}

var usernameField: UITextField = UITextField()
var passwordField: UITextField = UITextField()
var validationResults: ValidationResults = .notValidated

func submitFormGuard() {
    guard (validationResults == .valid) else {
        return
    }
    
    // Build form request and submit.
}

func submitFormIf() {
    if (validationResults != .valid) {
        return
    }
    
    // Build form request and submit.
}

func validateFormGuard() {
    guard let username = usernameField.text, let password = passwordField.text else {
        return
    }
    
    guard username.lengthOfBytes(using: String.Encoding.utf8) > 3 else {
        validationResults = .invalidUsername
        return
    }
    
    guard password.lengthOfBytes(using: String.Encoding.utf8) > 3 else {
        validationResults = .invalidPassword
        return
    }
    
    guard usernameExists(username) else {
        validationResults = .usernameExists
        return
    }
    
    validationResults = .valid
}

func validateFormIfs() {
    if let username = usernameField.text, let password = passwordField.text {
        if username.lengthOfBytes(using: String.Encoding.utf8) > 3 {
            if password.lengthOfBytes(using: String.Encoding.utf8) > 3 {
                if !usernameExists(username) {
                    validationResults = .valid
                }
                else {
                    validationResults = .usernameExists
                }
            }
            else {
                validationResults = .invalidPassword
            }
        }
        else {
            validationResults = .invalidUsername
        }
    }
}

func usernameExists(_ username: String) -> Bool {
    return false
}

validateFormGuard()
validateFormIfs()
