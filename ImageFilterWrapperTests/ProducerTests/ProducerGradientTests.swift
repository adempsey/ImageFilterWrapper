//
//  ProducerGradientTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class ProducerGradientTests: ProducerTests {
    
    func testGaussianProducesCorrectImage() {
        let checksum = "7d18969101485ed00691285dde41b3f6"
        let producer: ImageProducer = .Gradient(.Gaussian(center: CGPoint(x: 25,
                                                                          y: 25),
                                                          color0: .red,
                                                          color1: .blue,
                                                          radius: 10.0))
        self.testGenerator(producer, checksum: checksum)
    }

    func testLinearProducesCorrectImage() {
        let checksum = "60d18cd4558108c25cc6a5e9ad92d013"
        let producer: ImageProducer = .Gradient(.Linear(point0: CGPoint(x: 25,
                                                                        y: 25),
                                                        point1: CGPoint(x: 30,
                                                                        y: 30),
                                                        color0: .red,
                                                        color1: .blue))
        self.testGenerator(producer, checksum: checksum)
    }

    func testRadialProducesCorrectImage() {
        let checksum = "d80ec0ae7a20773a7e0dec970b883ae1"
        let producer: ImageProducer = .Gradient(.Radial(center: CGPoint(x: 25,
                                                                        y: 25),
                                                        radius0: 10.0,
                                                        radius1: 10.0,
                                                        color0: .red,
                                                        color1: .blue))
        self.testGenerator(producer, checksum: checksum)
    }

    func testSmoothLinearProducesCorrectImage() {
        let checksum = "d89db9412b4e88eeea9d7962815549e9"
        let producer: ImageProducer = .Gradient(.SmoothLinear(point0: CGPoint(x: 25,
                                                                              y: 25),
                                                              point1: CGPoint(x: 30,
                                                                              y: 30),
                                                              color0: .red,
                                                              color1: .blue))
        self.testGenerator(producer, checksum: checksum)
    }
    
}
