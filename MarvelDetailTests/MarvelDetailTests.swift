//
//  MarvelDetailTests.swift
//  MarvelDetailTests
//
//  Created by Daniel Vela on 14/4/21.
//

import XCTest
@testable import MarvelDetail

class MarvelDetailTests: XCTestCase {

    func testListCharacters() {
        let expectation = XCTestExpectation(description: "MarvelService")
        var character_list_result: [Marvel.CharacterDto]?
        MarvelService().listCharacters { result in
            switch result {
            case let .success(response):
                XCTAssertGreaterThan(response.count, 0)
                character_list_result = response
                expectation.fulfill()
            case let .failure(error):
                print("\(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(character_list_result)
    }

    func testCharacter() {
        let id = 1011334
        let expectation = XCTestExpectation(description: "MarvelService")
        var character: Marvel.CharacterDto?
        MarvelService().characterDetail(of: id) { result in
            switch result {
            case let .success(response):
                character = response
                expectation.fulfill()
            case let .failure(error):
                print("\(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(character)
    }

}
