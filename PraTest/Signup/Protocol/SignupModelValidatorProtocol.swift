//
//  SignupModelValidatorProtocol.swift
//  PraTest
//
//  Created by Toshiyana on 2022/04/12.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isValidEmailFormat(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
