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

extension CGAffineTransform: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
//        let value: NSValue = NSValue(bytes: &self, objCType: @encode(CGAffineTransform))
        return CIVector(cgAffineTransform: self)
    }

}

extension CGPoint: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIVector(cgPoint: self)
    }

}

extension CGRect: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIVector(cgRect: self)
    }

}

extension CGSize: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIVector(x: self.width, y: self.height)
    }

}

// MARK: UIKit Extensions

extension UIColor: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIColor(color: self)
    }

}

extension UIImage: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        return CIImage(image: self)!
    }

}

// MARK: IFW Extensions

extension Matrix: CoreImageConvertible {

    func coreImageFormat() -> NSObject {
        let floats: [CGFloat] = self.container.map {
            return ($0 as! CoreImageNumeric).coreImageFormat()
        }
        return CIVector(values: floats, count: self.container.count)
    }

}

// MARK: Numeric Types

public protocol Numeric {}

internal protocol CoreImageNumeric: Numeric {
    func coreImageFormat() -> CGFloat
}

extension Int: CoreImageNumeric {
    func coreImageFormat() -> CGFloat {
        return CGFloat(self)
    }
}

extension UInt: CoreImageNumeric {
    func coreImageFormat() -> CGFloat {
        return CGFloat(self)
    }
}

extension Float: CoreImageNumeric {
    func coreImageFormat() -> CGFloat {
        return CGFloat(self)
    }
}

extension Double: CoreImageNumeric {
    func coreImageFormat() -> CGFloat {
        return CGFloat(self)
    }
}
