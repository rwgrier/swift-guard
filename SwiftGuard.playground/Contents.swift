//  Swift Guard Post
//
//  Created by Ryan Grier on 03/06/16.
//  Copyright © 2016 Ryan Grier All rights reserved.

import UIKit

enum ValidationResults {
    case Valid, UsernameExists, InvalidUsername, InvalidPassword, NotValidated
}

var usernameField: UITextField = UITextField()
var passwordField: UITextField = UITextField()
var validationResults: ValidationResults = .NotValidated

func submitFormGuard() {
    guard (validationResults == .Valid) else {
        return
    }
    
    // Build form request and submit.
}

func submitFormIf() {
    if (validationResults != .Valid) {
        return
    }
    
    // Build form request and submit.
}

func validateFormGuard() {
    guard let username = usernameField.text, password = passwordField.text else {
        return
    }
    
    guard username.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 else {
        validationResults = .InvalidUsername
        return
    }
    
    guard password.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 else {
        validationResults = .InvalidPassword
        return
    }
    
    guard usernameExists(username) else {
        validationResults = .UsernameExists
        return
    }
    
    validationResults = .Valid
}

func validateFormIfs() {
    if let username = usernameField.text, password = passwordField.text {
        if username.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 {
            if password.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 3 {
                if !usernameExists(username) {
                    validationResults = .Valid
                }
                else {
                    validationResults = .UsernameExists
                }
            }
            else {
                validationResults = .InvalidPassword
            }
        }
        else {
            validationResults = .InvalidUsername
        }
    }
}

func usernameExists(username: String) -> Bool {
    return false
}

submitFormIf()
submitFormGuard()
