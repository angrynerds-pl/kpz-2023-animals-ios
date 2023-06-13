//
//  kpz_2023_animals_iosTests.swift
//  kpz-2023-animals-iosTests
//
//  Created by Rafał Kwiecień on 29/03/2023.
//

import XCTest
@testable import kpz_2023_animals_ios

final class kpz_2023_animals_iosTests: XCTestCase {

    func testLoginWithValidCredentials() {
        let viewModel = HomeViewModel()
        XCTAssertFalse(viewModel.isLogged)
        viewModel.login(email: "Login", password: "123")
        XCTAssertTrue(viewModel.isLogged)
    }
    
    func testLoginWithInvalidCredentials() {
        let viewModel = HomeViewModel()
        viewModel.login(email: "wrongEmail", password: "wrongPassword")
        XCTAssertFalse(viewModel.isLogged)
    }
    
    func testRegisterAndLoginWithNewUser() {
        let viewModel = HomeViewModel()
        let newEmail = "newEmail"
        let newPassword = "newPassword"
        
        viewModel.register(email: newEmail, password: newPassword)
        viewModel.login(email: newEmail, password: newPassword)
        XCTAssertTrue(viewModel.isLogged)
    }
    
    func testFetchAnimals() async {
        let expectation = XCTestExpectation(description: "Fetch Animals")
        let viewModel = OwnedAnimalViewModel()
        
        await viewModel.fetchAnimals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(viewModel.ownedAnimals.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
