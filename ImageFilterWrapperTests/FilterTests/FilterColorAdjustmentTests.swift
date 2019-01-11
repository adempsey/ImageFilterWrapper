//
//  FilterColorAdjustmentTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/10/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class FilterColorAdjustmentTests: FilterTests {

    func testColorClampProducesCorrectImage() {
        let checksum = "89634d68d9d9c3803076581dd6ad759c"
        let filter: ImageFilter = .ColorAdjustment(.ColorClamp(minComponents: (r: 0.4,
                                                                               g: 0.7,
                                                                               b: 0.2,
                                                                               a: 1.0),
                                                               maxComponents: (r: 0.5,
                                                                               g: 0.8,
                                                                               b: 0.3,
                                                                               a: 1.0)))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorControlsProducesCorrectImage() {
        let checksum = "724998c8e39a13ffc14f9096e36acfac"
        let filter: ImageFilter = .ColorAdjustment(.ColorControls(saturation: 0.5,
                                                                  brightness: 0.5,
                                                                  contrast: 0.5))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorMatrixProducesCorrectImage() {
        let checksum = "1a917270840eb42d3ca928bd218eec13"
        let filter: ImageFilter = .ColorAdjustment(.ColorMatrix(r: nil,
                                                                g: nil,
                                                                b: (x: 10.0,
                                                                    y: 10.0,
                                                                    z: 0.0,
                                                                    w: 1.0),
                                                                a: nil,
                                                                bias: nil))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorPolynomialProducesCorrectImage() {
        let checksum = "0321c75e0de0fd1bd3fc8f8895526f83"
        let filter: ImageFilter = .ColorAdjustment(.ColorPolynomial(r: nil,
                                                                    g: nil,
                                                                    b: (c: 10.0,
                                                                        b: 10.0,
                                                                        bb: 0.0,
                                                                        bbb: 1.0),
                                                                    a: nil))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testExposureAdjustProducesCorrectImage() {
        let checksum = "6be221622170222cb72f4fa45f397c63"
        let filter: ImageFilter = .ColorAdjustment(.ExposureAdjust(EV: 0.8))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testGammaAdjustProducesCorrectImage() {
        let checksum = "f648e0abf47c973755c9a75a60fafb80"
        let filter: ImageFilter = .ColorAdjustment(.GammaAdjust(power: 0.8))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testHueAdjustProducesCorrectImage() {
        let checksum = "5aa4d1963d1b6870e96cef058c0d7537"
        let filter: ImageFilter = .ColorAdjustment(.HueAdjust(angle: 30.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLinearToSRGBToneCurveProducesCorrectImage() {
        let checksum = "a8dadaba0fac2508b14bd88a606db26c"
        let filter: ImageFilter = .ColorAdjustment(.LinearToSRGBToneCurve)
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSRGBToneCurveToLinearProducesCorrectImage() {
        let checksum = "5967a52255393d87fa13f1e2bc94b3e2"
        let filter: ImageFilter = .ColorAdjustment(.SRGBToneCurveToLinear)
        self.testImageFilter(filter, checksum: checksum)
    }

    func testTemperatureAndTintProducesCorrectImage() {
        let checksum = "cb1bc3edbbd0c483c3232c16daeda5b3"
        let filter: ImageFilter = .ColorAdjustment(.TemperatureAndTint(neutral:(temperature: 5000,
                                                                                tint: 0),
                                                                       targetNeutral: (temperature: 6500,
                                                                                       tint: 0)))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testToneCurveProducesCorrectImage() {
        let checksum = "ad741ad4bd7b6379e754c7dfc9da360f"
        let filter: ImageFilter = .ColorAdjustment(.ToneCurve(point0: (tone: 0.5,
                                                                       lightness: 0.8),
                                                              point1: nil,
                                                              point2: nil,
                                                              point3: nil,
                                                              point4: nil))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testVibranceProducesCorrectImage() {
        let checksum = "402d41254f4e478bcf88790f3177a8d7"
        let filter: ImageFilter = .ColorAdjustment(.Vibrance(amount: 2.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testWhitePointAdjustProducesCorrectImage() {
        let checksum = "406cb7722ced8067ec2e6d7f47fdf6a1"
        let filter: ImageFilter = .ColorAdjustment(.WhitePointAdjust(color: .blue))
        self.testImageFilter(filter, checksum: checksum)
    }
}
