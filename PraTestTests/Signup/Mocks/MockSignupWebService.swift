//
//  MockSignupWebService.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/20.
//

import Foundation
@testable import PraTest

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
    }
}
