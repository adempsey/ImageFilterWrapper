//
//  UIImage+ImageFilterWrapperAdditions.swift
//  ImageFilterWrapperTests
//
//  Created by Andrew Dempsey on 1/8/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

import UIKit

extension UIImage {

    internal func md5() -> String {
        let imgData = UIImagePNGRepresentation(self)!
        var buffer = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        _ = buffer.withUnsafeMutableBytes { bufferBytes in
            _ = imgData.withUnsafeBytes { unsafeBytes in
                CC_MD5(unsafeBytes, CC_LONG(imgData.count), bufferBytes)
            }
        }

        let imgHash = buffer.map { String(format: "%02hhx", $0)}.joined()

        return imgHash
    }

}
