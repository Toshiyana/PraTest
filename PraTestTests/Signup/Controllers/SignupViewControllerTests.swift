//
//  SignupViewControllerTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/24.
//

import XCTest
@testable import PraTest

class SignupViewControllerTests: XCTestCase {

    override func setUp() {
        //
    }
    
    override func tearDown() {
        //
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
    }
}
