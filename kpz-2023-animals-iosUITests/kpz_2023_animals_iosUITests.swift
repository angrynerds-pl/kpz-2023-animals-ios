//
//  kpz_2023_animals_iosUITests.swift
//  kpz-2023-animals-iosUITests
//
//  Created by Rafał Kwiecień on 29/03/2023.
//

import XCTest

final class kpz_2023_animals_iosUITests: XCTestCase {

    func testLoginScreen() {
        let app = XCUIApplication()
        app.launch()

        let menuButton = app.buttons["ellipsis"]
        XCTAssertTrue(menuButton.exists)
        menuButton.tap()
        
        let menuLoginButton = app.buttons["loginButton"]
        XCTAssertTrue(menuLoginButton.exists)
        menuLoginButton.tap()

        let emailField = app.textFields["emailField"]
        let passwordField = app.secureTextFields["passwordField"]
        let loginButton = app.buttons["loginButton"]

        XCTAssertTrue(emailField.waitForExistence(timeout: 5))
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))

        XCTAssertTrue(emailField.isHittable)
        XCTAssertTrue(passwordField.isHittable)
        XCTAssertTrue(loginButton.isHittable)

        emailField.tap()
        emailField.typeText("incorrectEmail")
            
        passwordField.tap()
        passwordField.typeText("incorrectPassword")

        loginButton.tap()

        XCTAssertTrue(emailField.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertTrue(loginButton.exists)
    }

}
