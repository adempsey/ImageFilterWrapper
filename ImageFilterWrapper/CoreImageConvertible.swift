//
//  CoreImageConvertible.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/23/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

/**
 Creates a common protocol for transforming data structures into formats that can be directly
 consumed by core image filter APIs.
 */
internal protocol CoreImageConvertible {

    func coreImageFormat() -> NSObject
    
}

// MARK: Core Graphics Extensions

extension CGPoint: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIVector(cgPoint: self)
    }

}

// MARK: UIKit Extensions

extension UIImage: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIImage(image: self)!
    }

}
