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
        
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated,"First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        let signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Kargopolov",
                                              email: "test@test.com",
                                              password:"12345678",
                                              repeatPassword:"12345678")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
    }
}
