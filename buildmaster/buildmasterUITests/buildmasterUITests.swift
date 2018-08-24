//
//  buildmasterUITests.swift
//  buildmasterUITests
//
//  Created by Christian on 8/24/18.
//  Copyright © 2018 Christian. All rights reserved.
//

import XCTest
import AppCenterXCUITestExtensions

class buildmasterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testACTLaunchUsingSwift() {
        let app = ACTLaunch.launch()
        XCTAssertNotNil(app)
        ACTLabel.labelStep("Given the app launched using ACTLaunch.launch from Swift")
        app?.terminate()
    }

    func testACTLaunchApplicationUsingSwift() {
        let app = XCUIApplication()
        let launched = ACTLaunch.launch(app)
        XCTAssertEqual(app, launched,
                       "Expected .launch(app): to return the application it" +
            "was passed as an argument.")
        ACTLabel.labelStep("Given app launched using ACTLaunch.launch(app) from Swift")
        app.terminate()
    }

    func testACTLabelClassMethodWithSwift() {
        let app: XCUIApplication = ACTLaunch.launch()
        ACTLabel.labelStep("Given the app has launched")
        ACTLabel.labelStep("Then I %@ the %@ button %@ times",
                           args: getVaList(["touch", "red", "3"]))
        XCTAssert(true, "This test should always pass")
        app.terminate()
    }
    
}
