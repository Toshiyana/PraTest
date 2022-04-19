//
//  MockSignupModelValidator.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/19.
//

import Foundation
@testable import PraTest

class MockSignupModelValidator: SignupModelValidatorProtocol {

    var isFirstNameValidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        return true
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
}
