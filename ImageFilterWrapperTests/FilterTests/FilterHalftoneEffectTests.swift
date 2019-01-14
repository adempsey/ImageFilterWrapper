//
//  FilterHalftoneEffectTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class FilterHalftoneEffectTests: FilterTests {

    func testCircularScreenProducesCorrectImage() {
        let checksum = "20e0faa11b011d62cfa45f4e8537b17a"
        let filter: ImageFilter = .HalftoneEffect(.CircularScreen(center: CGPoint(x: 15,
                                                                                  y: 15),
                                                                  width: 5,
                                                                  sharpness: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testCMYKHalftoneProducesCorrectImage() {
        let checksum = "43a6f5d69437addb706b99b2868f99d5"
        let filter: ImageFilter = .HalftoneEffect(.CMYKHalftone(center: CGPoint(x: 15,
                                                                                y: 15),
                                                                width: 5,
                                                                angle: 30.0,
                                                                sharpness: 5.0,
                                                                GCR: 5.0,
                                                                UCR: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDotScreenProducesCorrectImage() {
        let checksum = "4674cc471ff094189497bf2604c72adf"
        let filter: ImageFilter = .HalftoneEffect(.DotScreen(center: CGPoint(x: 15,
                                                                             y: 15),
                                                             angle: 30.0,
                                                             width: 5,
                                                             sharpness: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testHatchedScreenProducesCorrectImage() {
        let checksum = "2c764f376d8cf866bc56f8489a3b9633"
        let filter: ImageFilter = .HalftoneEffect(.HatchedScreen(center: CGPoint(x: 15,
                                                                                 y: 15),
                                                                 angle: 30.0,
                                                                 width: 5,
                                                                 sharpness: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLineScreenProducesCorrectImage() {
        let checksum = "0f5fe733678d7674d6ca42ec4b83f49f"
        let filter: ImageFilter = .HalftoneEffect(.LineScreen(center: CGPoint(x: 15,
                                                                              y: 15),
                                                              angle: 30.0,
                                                              width: 5,
                                                              sharpness: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

}
