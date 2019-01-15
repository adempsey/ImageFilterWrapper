//
//  ProducerTests.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import XCTest
@testable import ImageFilterWrapper

class ProducerTests: XCTestCase {
    
    internal func testGenerator(_ producer: ImageProducer, checksum: String) {
        let producedImg = UIImage.generate(producer, size: CGSize(width: 50, height: 50))
        let producedImgHash = producedImg.md5()

        XCTAssertEqual(checksum, producedImgHash, "Produced unknown checksum")
    }
    
}
