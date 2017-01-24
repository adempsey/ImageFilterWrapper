//
//  Filter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum ImageFilter {

    case Blur(BlurFilter)

    internal var subfilter: Subfilter {
        switch self {
        case let .Blur(subfilter):
            return subfilter
        }
    }

}

extension CIFilter {

    internal func setOptions(_ options: (value: Any?, key: FilterOption)...) {
        for option in options {
            if let value = option.value {
                if let convertibleValue = value as? CoreImageConvertible {
                    self.setValue(convertibleValue.coreImageFormat(), forKey: option.key.rawValue)
                } else {
                    self.setValue(value, forKey: option.key.rawValue)
                }
            }
        }
    }

}
