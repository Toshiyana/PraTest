//
//  PraTestUITests.swift
//  PraTestUITests
//
//  Created by Toshiyana on 2022/05/01.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

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
        
        // textFieldにPlaceholderを設定してRecordした場合
        app.textFields["First Name"].tap()
        app.textFields["Last Name"].tap()
        app.textFields["Email"].tap()
        app.textFields["Password"].tap()
        app.textFields["Repeat Password"].tap()
        app.buttons["Sign Up"].tap()
                
                
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
