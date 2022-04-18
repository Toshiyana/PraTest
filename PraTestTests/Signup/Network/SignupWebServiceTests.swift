//
//  SignupWebServiceTests.swift
//  PraTestTests
//
//  Created by Toshiyana on 2022/04/17.
//

import XCTest
@testable import PraTest

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signFormRequestModel = SignupFormRequestModel(firstName: "Taro", lastName: "Sato",
                                                          email: "test@test.com", password: "12345678")
    }
    
    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        
        MockURLProtocol.stubResponseData = nil // need to reset response data because it is static one.
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidReqeustURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString take place, the response model must be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }

}
