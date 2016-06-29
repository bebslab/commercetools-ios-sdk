//
// Copyright (c) 2016 Commercetools. All rights reserved.
//

import XCTest
@testable import Commercetools

class CartTests: XCTestCase {

    override func setUp() {
        super.setUp()

        setupTestConfiguration()
    }

    override func tearDown() {
        cleanPersistedTokens()
        super.tearDown()
    }
    
    func testRetrieveActiveCart() {
        let activeCartExpectation = expectationWithDescription("active cart expectation")

        let username = "swift.sdk.test.user2@commercetools.com"
        let password = "password"

        AuthManager.sharedInstance.loginUser(username, password: password, completionHandler: {_ in})

        Cart.create(["currency": "EUR"], result: { result in
            if let response = result.response, cartState = response["cartState"] as? String, id = response["id"] as? String
                    where result.isSuccess && cartState == "Active" {
                Cart.active(result: { result in
                    if let response = result.response, activeCartId = response["id"] as? String where activeCartId == id {
                        activeCartExpectation.fulfill()
                    }
                })
            }
        })

        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}
