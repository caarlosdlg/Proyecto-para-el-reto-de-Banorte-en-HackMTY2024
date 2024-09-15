//
//  Proyecto_para_el_reto_de_Banorte_en_HackMTY2024UITestsLaunchTests.swift
//  Proyecto-para-el-reto-de-Banorte-en-HackMTY2024UITests
//
//  Created by Carlos Delgado on 15/09/24.
//

import XCTest

final class Proyecto_para_el_reto_de_Banorte_en_HackMTY2024UITestsLaunchTests: XCTestCase {

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
