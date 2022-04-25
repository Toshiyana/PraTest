//
//  SignupPresenterProtocol.swift
//  PraTest
//
//  Created by Toshiyana on 2022/04/25.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
