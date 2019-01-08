//
//  CoreImageConvertibleTests.swift
//  CoreImageConvertibleTests
//
//  Created by Andrew Dempsey on 1/7/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class CoreImageConvertibleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCIVectorWillInitializeFromCGPoint() {
        let point = CGPoint(x: 0, y: 1)
        let a = CIVector(cgPoint: point)
        let b = point.coreImageFormat()

        XCTAssertEqual(a, b)
    }

    func testThatCIVectorWillInitializeFromCGRect() {
        let rect = CGRect(x: 0.0, y: 0.0, width: 25.0, height: 25.0)
        let a = CIVector(cgRect: rect)
        let b = rect.coreImageFormat()

        XCTAssertEqual(a, b)
    }

    func testThatCIVectorWillInitializeFromCGSize() {
        let size = CGSize(width: 25.0, height: 25.0)
        let a = CIVector(x: size.width, y: size.height)
        let b = size.coreImageFormat()

        XCTAssertEqual(a, b)
    }

}
