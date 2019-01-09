//
//  FilterTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/8/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class FilterTests: XCTestCase {

    private var img: UIImage!

    override func setUp() {
        super.setUp()
        img = UIImage(named: "lion.png",
                      in: Bundle(for: type(of: self)),
                      compatibleWith: nil)
    }

    internal func testImageFilter(_ filter: ImageFilter, checksum: String) {
        let filteredImg = img.applyFilters(filter)
        let imgHash = filteredImg.md5()

        XCTAssertEqual(checksum, imgHash)
    }
    
}
