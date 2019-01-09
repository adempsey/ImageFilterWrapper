//
//  FilterBlurTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/8/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class FilterBlurTests: FilterTests {

    func testBoxProducesCorrectImage() {
        let checksum = "33672a84319a13df1bfacaa4b310775f"
        let filter: ImageFilter = .Blur(.Box(radius: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDiscProducesCorrectImage() {
        let checksum = "f3f70737d076d92a0a96845d5e471699"
        let filter: ImageFilter = .Blur(.Disc(radius: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testGaussianProducesCorrectImage() {
        let checksum = "b84cecae5acd5ee4b56bbda3a190c880"
        let filter: ImageFilter = .Blur(.Gaussian(radius: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMaskedVariableProducesCorrectImage() {
        let checksum = "0e71c9b96e3758348ddcb15a2ee4c643"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)
        let filter: ImageFilter = .Blur(.MaskedVariable(mask: mask,
                                                        radius: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMedianProducesCorrectImage() {
        let checksum = "9e65e0e7f14f8fe380d07fa836351693"
        let filter: ImageFilter = .Blur(.MedianFilter)
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMotionProducesCorrectImage() {
        let checksum = "d77d49c17d962724b38ca8d223552a44"
        let filter: ImageFilter = .Blur(.Motion(radius: 1.0,
                                                angle: 30.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testNoiseReductionProducesCorrectImage() {
        let checksum = "a408da63612d801e5a0cd830c8a6b096"
        let filter: ImageFilter = .Blur(.NoiseReduction(noiseLevel: 0.5,
                                                        sharpness: 5.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testZoomProducesCorrectImage() {
        let checksum = "ffcf63380a7cfe19ea40808e314d0ec6"
        let filter: ImageFilter = .Blur(.Zoom(center: CGPoint(x: 5.0,
                                                              y: 5.0),
                                              amount: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

}
