//
//  SignupViewControllerTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/24.
//

import XCTest
@testable import PraTest

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController", creator: nil) as SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty() {
        
        
        XCTAssertEqual(sut.firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.lastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "", "Repeat password text field was not empty when the view controller initially loaded")
    }
}
