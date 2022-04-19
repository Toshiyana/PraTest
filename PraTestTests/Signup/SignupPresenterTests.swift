//
//  SignupPresenterTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/19.
//

import XCTest
@testable import PraTest

class SignupPresenterTests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        let signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Kargopolov",
                                              email: "test@test.com",
                                              password:"12345678",
                                              repeatPassword:"12345678")
        let sut = SignupPresenter()
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        
        // Assert
    }

}
