//
//  JTAppleCalendarExampleTests.swift
//  JTAppleCalendarExampleTests
//
//  Created by 양호준 on 2023/07/07.
//

import XCTest

@testable import JTAppleCalendarExample

final class JTAppleCalendarExampleTests: XCTestCase {
    var sut: ViewController!

    override func setUpWithError() throws {
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        let result = sut.add(1, 1)

        XCTAssertEqual(result, 3)
    }
}
