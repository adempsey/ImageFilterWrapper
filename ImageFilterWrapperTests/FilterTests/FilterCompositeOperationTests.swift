//
//  FilterCompositeOperationTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/14/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import Foundation
@testable import ImageFilterWrapper

class FilterCompositeOperationTests: FilterTests {

    func testAdditionCompositingProducesCorrectImage() {
        let checksum = "b47d68e2780a08433296a6a39505b1cb"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.AdditionCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorBlendModeProducesCorrectImage() {
        let checksum = "c6741f74f59f38eb02dbe937906b8f55"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.ColorBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorBurnBlendModeProducesCorrectImage() {
        let checksum = "e2270905e6b92786d610817b20047e22"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.ColorBurnBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testColorDodgeBlendModeProducesCorrectImage() {
        let checksum = "2aec9a3840e8f5b7f6a0938867c06821"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.ColorDodgeBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDarkenBlendModeProducesCorrectImage() {
        let checksum = "f1500d40aea16c1cd2ba2bf8d844a638"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.DarkenBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDifferenceBlendModeProducesCorrectImage() {
        let checksum = "bb8629bf4c41cabd3e2a9c392410e54c"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.DifferenceBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testDivideBlendModeProducesCorrectImage() {
        let checksum = "41cf740b137429f7097a446c7d0ae3c0"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.DivideBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testExclusionBlendModeProducesCorrectImage() {
        let checksum = "f855fd59788e2dc78b1f9bfa945b0805"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.ExclusionBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testHardLightBlendModeProducesCorrectImage() {
        let checksum = "5b6e1a954efd83e669ab39f2684426de"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.HardLightBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testHueBlendModeProducesCorrectImage() {
        let checksum = "18b7e6ac05f68a338cc0db353d5732a5"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.HueBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLightenBlendModeProducesCorrectImage() {
        let checksum = "1538f0a2c66d37633feb73f5cb009657"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.LightenBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLinearBurnBlendModeProducesCorrectImage() {
        let checksum = "0ec63666b3372339db840f32bf1b2fe0"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.LinearBurnBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLinearDodgeBlendModeProducesCorrectImage() {
        let checksum = "2e26b64fb13392eb137e82e8e98e3e6c"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.LinearDodgeBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testLuminosityBlendModeProducesCorrectImage() {
        let checksum = "6a9879dc5748eaae44bfa1b1d9bcfa91"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.LuminosityBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMaximumCompositingProducesCorrectImage() {
        let checksum = "1538f0a2c66d37633feb73f5cb009657"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.MaximumCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMinimumCompositingProducesCorrectImage() {
        let checksum = "f1500d40aea16c1cd2ba2bf8d844a638"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.MinimumCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMultiplyBlendModeProducesCorrectImage() {
        let checksum = "c0875094d5800675280ce2a804de0f4e"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.MultiplyBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testMultiplyCompositingProducesCorrectImage() {
        let checksum = "c0875094d5800675280ce2a804de0f4e"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.MultiplyCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testOverlayBlendModeProducesCorrectImage() {
        let checksum = "9530c54f73fb629b0f759b9e516388b4"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.OverlayBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testPinLightBlendModeProducesCorrectImage() {
        let checksum = "1e116a1244dc3dd871f0df52805612be"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.PinLightBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSaturationBlendModeProducesCorrectImage() {
        let checksum = "3d726adfa0ebef4190cd931dda06080d"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SaturationBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testScreenBlendModeProducesCorrectImage() {
        let checksum = "fc664c20753cf7f38d033c6fc15a8b31"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.ScreenBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSoftLightBlendModeProducesCorrectImage() {
        let checksum = "c76ff792b646d5d39b25c66f2b937f72"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SoftLightBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSourceAtopCompositingProducesCorrectImage() {
        let checksum = "fa5b1a915abfb24ca059318a9c36d08c"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SourceAtopCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSourceInCompositingProducesCorrectImage() {
        let checksum = "fa5b1a915abfb24ca059318a9c36d08c"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SourceInCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSourceOutCompositingProducesCorrectImage() {
        let checksum = "fc53e22907179f328aea6b66c58cc2fe"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SourceOutCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSourceOverCompositingProducesCorrectImage() {
        let checksum = "fa5b1a915abfb24ca059318a9c36d08c"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SourceOverCompositing(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

    func testSubtractBlendModeProducesCorrectImage() {
        let checksum = "1965cd8dd27672bfc0c8c0068d0f1b41"
        let mask = UIImage(named: "giraffe.png",
                           in: Bundle(for: type(of: self)),
                           compatibleWith: nil)!
        let filter: ImageFilter = .CompositeOperation(.SubtractBlendMode(backgroundImage: mask))
        self.testImageFilter(filter, checksum: checksum)
    }

}
