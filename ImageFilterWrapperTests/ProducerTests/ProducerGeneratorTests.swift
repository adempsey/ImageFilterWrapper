//
//  ProducerGeneratorTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/14/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import Foundation
@testable import ImageFilterWrapper

class ProducerGeneratorTests: ProducerTests {

    func testAztecCodeProducesCorrectImage() {
        let checksum = "633dca75e7d9d757c167b6d10c40cf55"
        let producer: ImageProducer = .Generator(.AztecCode(message: "hello",
                                                            correctionLevel: nil,
                                                            layers: nil,
                                                            compactStyle: true))
        self.testGenerator(producer, checksum: checksum)
    }

    func testCheckerboardProducesCorrectImage() {
        let checksum = "140d10c911c0eeef3050536611b054b9"
        let producer: ImageProducer = .Generator(.Checkerboard(center: CGPoint(x: 10.0,
                                                                               y: 10.0),
                                                               color0: .white,
                                                               color1: .blue,
                                                               width: 5.0,
                                                               sharpness: 5.0))
        self.testGenerator(producer, checksum: checksum)
    }

    func testCode128BarcodeProducesCorrectImage() {
        let checksum = "8f5e87392ff8f6465d7716c9195e696f"
        let producer: ImageProducer = .Generator(.Code128Barcode(message: "hello",
                                                                 quietSpace: 5))
        self.testGenerator(producer, checksum: checksum)
    }

    func testConstantColorProducesCorrectImage() {
        let checksum = "055e16e4cbb3fbce7b4c26b4b1d88ac8"
        let producer: ImageProducer = .Generator(.ConstantColor(color: .orange))
        self.testGenerator(producer, checksum: checksum)
    }

    func testLenticularHaloProducesCorrectImage() {
        let checksum = "9dae906894724b8fb19b0c4705204e53"
        let producer: ImageProducer = .Generator(.LenticularHalo(center: CGPoint(x: 15.0,
                                                                                 y: 15.0),
                                                                 color: .blue,
                                                                 haloRadius: 20.0,
                                                                 haloWidth: 20.0,
                                                                 haloOverlap: 5.0,
                                                                 striationStrength: nil,
                                                                 striationContrast: nil,
                                                                 time: 0.0))
        self.testGenerator(producer, checksum: checksum)
    }

    func testPDF417BarcodeProducesCorrectImage() {
        let checksum = "905087bfd872ca29f6bd88ace53f63af"
        let producer: ImageProducer = .Generator(.PDF417Barcode(message: "hello",
                                                                minWidth: nil,
                                                                maxWidth: nil,
                                                                minHeight: nil,
                                                                maxHeight: nil,
                                                                dataColumns: nil,
                                                                rows: nil,
                                                                preferredAspectRatio: nil,
                                                                compactionMode: nil,
                                                                compactStyle: nil,
                                                                correctionLevel: nil,
                                                                alwaysSpecifyCompaction: nil))
        self.testGenerator(producer, checksum: checksum)
    }

    func testQRCodeProducesCorrectImage() {
        let checksum = "7438e216bd52f0c27b32d2332ebd13db"
        let producer: ImageProducer = .Generator(.QRCode(message: "hello",
                                                         correctionLevel: nil))
        self.testGenerator(producer, checksum: checksum)
    }

    func testRandomProducesCorrectImage() {
        let checksum = "d84df94a610cc7e343d00f9b6e1e40ec"
        let producer: ImageProducer = .Generator(.Random)
        self.testGenerator(producer, checksum: checksum)
    }

    func testStarShineProducesCorrectImage() {
        let checksum = "47d038c18f6dd06c005b29a5354517fa"
        let producer: ImageProducer = .Generator(.StarShine(center: CGPoint(x: 20.0,
                                                                            y: 20.0),
                                                            color: .blue,
                                                            radius: 5.0,
                                                            crossScale: 5.0,
                                                            crossAngle: 30.0,
                                                            crossOpacity: nil,
                                                            crossWidth: nil,
                                                            epsilon: nil))
        self.testGenerator(producer, checksum: checksum)
    }

    func testStripesProducesCorrectImage() {
        let checksum = "fe03777873b82f5582b693119792d8d4"
        let producer: ImageProducer = .Generator(.Stripes(center: CGPoint(x: 15.0,
                                                                          y: 15.0),
                                                          color0: .blue,
                                                          color1: .green,
                                                          width: 5.0,
                                                          sharpness: 5.0))
        self.testGenerator(producer, checksum: checksum)
    }

    func testSunbeamsProducesCorrectImage() {
        let checksum = "b1ecd81a37ad72e714de6c7a2fd7808d"
        let producer: ImageProducer = .Generator(.Sunbeams(center: CGPoint(x: 15.0,
                                                                           y: 15.0),
                                                           color: .blue,
                                                           sunRadius: 5.0,
                                                           maxStriationRadius: 3.0,
                                                           striationStrength: 10.0,
                                                           striationContrast: nil,
                                                           time: 0.0))
        self.testGenerator(producer, checksum: checksum)
    }

}
