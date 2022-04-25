//
//  MockSignupPresenter.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/25.
//

import Foundation
@testable import PraTest

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
