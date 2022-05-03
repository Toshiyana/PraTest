//
//  PraTestUITests.swift
//  PraTestUITests
//
//  Created by Toshiyana on 2022/05/01.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // textFieldにPlaceholderを設定せずにRecordした場合（boundBy: 0で順番づけされるため、UIの変更に弱いので良くない）
//        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        element.children(matching: .textField).element(boundBy: 0).tap()
//        element.children(matching: .textField).element(boundBy: 1).tap()
//        element.children(matching: .textField).element(boundBy: 2).tap()
//        element.children(matching: .textField).element(boundBy: 3).tap()
//        element.children(matching: .textField).element(boundBy: 4).tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Sign Up"]/*[[".buttons[\"Sign Up\"].staticTexts[\"Sign Up\"]",".staticTexts[\"Sign Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // textFieldにPlaceholderを設定してRecordした場合(placeholderでなく、identifierでも指定可能)
        // tapを除去し、以下のように記述するのがbetterな方法
//        let firstName = app.textFields["firstNameTextField"]
//        let lastName = app.textFields["lastNameTextField"]
//        let email = app.textFields["emailTextField"]
//        let password = app.secureTextFields["passwordTextField"]
//        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
//        let signupButton = app.buttons["signupButton"]
                
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email address UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button UITextField is not enabled for user interactions")
    }
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        // Arrange
//        let firstName = app.textFields["firstNameTextField"]
        firstName.tap()
        firstName.typeText("S")
        
//        let lastName = app.textFields["lastNameTextField"]
        lastName.tap()
        lastName.typeText("K")
        
//        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("@")
        
//        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("123456")
        
//        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
//        let signupButton = app.buttons["signupButton"]
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),
                      "An Error Alert dialog was not presented when invalid signup form was submitted")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
