//
//  JDropDownAlertTests.swift
//  JDropDownAlertTests
//
//  Created by Won on 17/05/2017.
//  Copyright © 2017 Won. All rights reserved.
//

import XCTest
@testable import JDropDownAlert

class JDropDownAlertTests: XCTestCase {

	var sut: JDropDownAlert!

	override func setUp() {
		super.setUp()
		sut = JDropDownAlert(position: .bottom, direction: .toLeft)
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func testInitTopNormal() {
		sut = JDropDownAlert(position: .top, direction: .normal)
		XCTAssertEqual(sut.position, AlertPosition.top)
		XCTAssertEqual(sut.direction, AnimationDirection.normal)
	}

	func testInitTopToLeft() {
		sut = JDropDownAlert(position: .top, direction: .toLeft)
		XCTAssertEqual(sut.direction, AnimationDirection.toLeft)
	}

	func testInitTopToRight() {
		sut = JDropDownAlert(position: .top, direction: .toRight)
		XCTAssertEqual(sut.direction, AnimationDirection.toRight)
	}

	func testInitBottomNormal() {
		sut = JDropDownAlert(position: .bottom, direction: .normal)
		XCTAssertEqual(sut.position, AlertPosition.bottom)
		XCTAssertEqual(sut.direction, AnimationDirection.normal)
	}

	func testInitBottomToLeft() {
		sut = JDropDownAlert(position: .bottom, direction: .toLeft)
		XCTAssertEqual(sut.direction, AnimationDirection.toLeft)
	}

	func testInitBottomToRight() {
		sut = JDropDownAlert(position: .bottom, direction: .toRight)
		XCTAssertEqual(sut.direction, AnimationDirection.toRight)
	}

	func testTitleFont() {
		sut.titleFont = UIFont.boldSystemFont(ofSize: 10)
		XCTAssertEqual(sut.titleFont, UIFont.boldSystemFont(ofSize: 10))
	}

	func testMessageFont() {
		sut.messageFont = UIFont.boldSystemFont(ofSize: 10)
		XCTAssertEqual(sut.messageFont, UIFont.boldSystemFont(ofSize: 10))
	}

	func testRequiredInit() {
		let archiver = NSKeyedUnarchiver(forReadingWith: Data())
		let sut = JDropDownAlert(coder: archiver)
		XCTAssertNotNil(sut)
	}

	func testAlertWith() {
		sut.alertWith("test title", message: "test message")
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertEqual(sut.delay, 2.0)

		sut.alertWith("test", delay: 4.0)
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertEqual(sut.delay, 4.0)
	}

	func testAlertWithToRight() {
		sut.direction = .toRight
		sut.alertWith("test title", message: "test message")
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertEqual(sut.delay, 2.0)

		sut.position = .bottom
		sut.direction = .normal
		sut.alertWith("test", delay: 4.0)
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertEqual(sut.delay, 4.0)

		sut.position = .top
		sut.direction = .normal
		sut.alertWith("test title", message: "test message")
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertEqual(sut.delay, 2.0)
	}

	func testDidTap() {
		sut.didTapBlock = {}
		sut.viewDidTap()
		XCTAssertNil(sut.superview)
	}
}
