//
//  SignupWebServiceTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/17.
//

import XCTest
@testable import PraTest

class SignupWebServiceTests: XCTestCase {

    override func setUp() {
        //
    }
    
    override func tearDown() {
        //
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        // Arrange
        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        
        let signFormRequestModel = SignupFormRequestModel(firstName: "Taro", lastName: "Sato", email: "test@test.com", password: "12345678")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

}