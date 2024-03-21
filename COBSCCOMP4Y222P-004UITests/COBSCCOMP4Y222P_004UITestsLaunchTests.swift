//
//  COBSCCOMP4Y222P_004UITestsLaunchTests.swift
//  COBSCCOMP4Y222P-004UITests
//
//  Created by NIBM-LAB04-PC03 on 2024-03-13.
//

import XCTest

final class COBSCCOMP4Y222P_004UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
