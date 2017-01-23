//
//  Filter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum Filter {

    case Blur(BlurFilter)

    var subfilter: Subfilter {
        switch self {
        case let .Blur(subfilter):
            return subfilter
        }
    }

}

extension CIFilter {

    func apply(value: Any?, forKey key: FilterOption) {
        if let value = value {
            self.setValue(value, forKey: key.rawValue)
        }
    }

}
