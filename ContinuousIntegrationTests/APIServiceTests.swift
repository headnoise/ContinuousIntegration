//
//  APIServiceTests.swift
//  ContinuousIntegrationTests
//
//  Created by Maximilian Sonntag on 04/14/2019.
//  Copyright © 2019 Sonntag. All rights reserved.
//

import XCTest
@testable import ContinuousIntegration

class APIServiceTests: XCTestCase {
    
    var sut: APIService?
    
    override func setUp() {
        super.setUp()
        sut = APIService()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetch_popular_photos() {

        // Given A apiservice
        let sut = self.sut!

        // When fetch popular photo
        let expect = XCTestExpectation(description: "callback")

        sut.fetchPopularPhoto(complete: { (success, photos, error) in
            expect.fulfill()
            XCTAssertEqual( photos.count, 16)
            for photo in photos {
                XCTAssertNotNil(photo.id)
            }
            
        })

        wait(for: [expect], timeout: 3.1)
    }
    
}
