//
//  SecurityTests.swift
//  MarvelDetailTests
//
//  Created by Daniel Vela on 15/4/21.
//

import XCTest

class SecurityTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMd5() throws {
        XCTAssertEqual("1a23b10d30873baa299149b8f5".md5(), "91e8e2712446a67d3bc6eff5c5ff61ff")

        XCTAssertNotEqual("1a23b10d30873baa299149b8f6".md5(), "91e8e2712446a67d3bc6eff5c5ff61ff")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
