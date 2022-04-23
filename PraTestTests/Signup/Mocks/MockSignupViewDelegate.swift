//
//  MockSignupViewDelegate.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/23.
//

import Foundation
import XCTest
@testable import PraTest

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var successfullSignupCounter = 0
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        //
    }
    
}
