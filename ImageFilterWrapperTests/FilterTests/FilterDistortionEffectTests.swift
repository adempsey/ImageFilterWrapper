//
//  FilterDistortionEffectTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/9/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class FilterDistortionEffectTests: FilterTests {

    func testBumpDistortionProducesCorrectImage() {
        let checksum = "f7d7eca6ff116a38c043ae3a09ae0f53"
        let filter: ImageFilter = .DistortionEffect(.BumpDistortion(center: CGPoint(x: 10.0,
                                                                                    y: 10.0),
                                                                    radius: 2.0,
                                                                    scale: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testBumpDistortionLinearProducesCorrectImage() {
        let checksum = "9e65e0e7f14f8fe380d07fa836351693"
        let filter: ImageFilter = .DistortionEffect(.BumpDistortionLinear(center: CGPoint(x: 10.0,
                                                                                          y: 10.0),
                                                                          radius: 2.0,
                                                                          angle: 30.0,
                                                                          scale: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testCircleSplashDistortionProducesCorrectImage() {
        let checksum = "fc53e22907179f328aea6b66c58cc2fe"
        let filter: ImageFilter = .DistortionEffect(.CircleSplashDistortion(center: nil,
                                                                            radius: 10.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testCircularWrapProducesCorrectImage() {
        let checksum = "cb63df71c4b73cc1a18485ed6962959a"
        let filter: ImageFilter = .DistortionEffect(.CircularWrap(center: CGPoint(x: 10.0,
                                                                                  y: 10.0),
                                                                  radius: 2.0,
                                                                  angle: 30.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDrosteProducesCorrectImage() {
        let checksum = "2955bdcd0e276197a4a173b547df309c"
        let filter: ImageFilter = .DistortionEffect(.Droste(insetPoint0: CGPoint(x: 10.0,
                                                                                 y: 10.0),
                                                            insetPoint1: CGPoint(x: 12.0,
                                                                                 y: 12.0),
                                                            strands: 3.0,
                                                            periodicity: 3.0,
                                                            rotation: 3.0,
                                                            zoom: 3.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDisplacementDistortionProducesCorrectImage() {
        let checksum = "884cf594281ee25cbad061fb68055314"
        let img2 = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .DistortionEffect(.DisplacementDistortion(displacementImage: img2,
                                                                            scale: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testGlassDistortionProducesCorrectImage() {
        let checksum = "4ee27b5f65619e6707f2d70272cbde4f"
        let img2 = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .DistortionEffect(.GlassDistortion(texture: img2,
                                                                     center: CGPoint(x: 10.0,
                                                                                     y: 10.0),
                                                                     scale: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testGlassLozengeProducesCorrectImage() {
        let checksum = "9e65e0e7f14f8fe380d07fa836351693"
        let filter: ImageFilter = .DistortionEffect(.GlassLozenge(point0: CGPoint(x: 10.0,
                                                                                  y: 10.0),
                                                                  point1: CGPoint(x: 12.0,
                                                                                  y: 12.0),
                                                                  radius: 1.0,
                                                                  refraction: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testHoleDistortionProducesCorrectImage() {
        let checksum = "afc1a38ea3553d7529e3387cd3905ee9"
        let filter: ImageFilter = .DistortionEffect(.HoleDistortion(center: CGPoint(x: 10.0,
                                                                                    y: 10.0),
                                                                    radius: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLightTunnelProducesCorrectImage() {
        let checksum = "b7f7e129e68ee93f8d02c1e5b4eff81e"
        let filter: ImageFilter = .DistortionEffect(.LightTunnel(center: CGPoint(x: 10.0,
                                                                                 y: 10.0),
                                                                 rotation: 1.0,
                                                                 radius: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testPinchDistortionProducesCorrectImage() {
        let checksum = "fcd6339db48596ffdecc2cf0e5689ffa"
        let filter: ImageFilter = .DistortionEffect(.PinchDistortion(center: CGPoint(x: 10.0,
                                                                                     y: 10.0),
                                                                     radius: 1.0,
                                                                     scale: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testStretchCropProducesCorrectImage() {
        let checksum = "299663620e8e4196abc7bf75874f43aa"
        let filter: ImageFilter = .DistortionEffect(.StretchCrop(size: CGSize(width: 3.0,
                                                                              height: 3.0),
                                                                 cropAmount: 2.0,
                                                                 centerStretchAmount: 2.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testTorusLensDistortionProducesCorrectImage() {
        let checksum = "9e65e0e7f14f8fe380d07fa836351693"
        let filter: ImageFilter = .DistortionEffect(.TorusLensDistortion(center: CGPoint(x: 10.0,
                                                                                         y: 10.0),
                                                                         radius: 1.0,
                                                                         width: 1.0,
                                                                         refraction: 1.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testTwirlDistortionProducesCorrectImage() {
        let checksum = "aacd4c0be28c1fa35decc4843bf1c867"
        let filter: ImageFilter = .DistortionEffect(.TwirlDistortion(center: CGPoint(x: 10.0,
                                                                                     y: 10.0),
                                                                     radius: 1.0,
                                                                     angle: 30.0))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testVortexDistortionProducesCorrectImage() {
        let checksum = "a04d54c00765a957136269bf1da24755"
        let filter: ImageFilter = .DistortionEffect(.VortexDistortion(center: CGPoint(x: 10.0,
                                                                                      y: 10.0),
                                                                      radius: 1.0,
                                                                      angle: 30.0))
        self.testImageFilter(filter, checksum: checksum)
    }
}
