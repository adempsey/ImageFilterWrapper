//
//  CoreImageConvertible.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/23/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

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
