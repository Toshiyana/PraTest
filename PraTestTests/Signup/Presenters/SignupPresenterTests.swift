//
//  SignupPresenterTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/19.
//

import XCTest
@testable import PraTest

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUp() {
        
        // Arrange
        signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Kargopolov",
                                              email: "test@test.com",
                                              password:"12345678",
                                              repeatPassword:"12345678")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockSignupViewDelegate)
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
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

        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfullSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1)
    }
}
