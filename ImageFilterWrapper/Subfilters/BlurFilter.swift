//
//  BlurFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum BlurFilter {
    case Box(radius: Float?)
}

extension BlurFilter: Subfilter {

    internal var key: String {
        switch self {
        case .Box: return "CIBoxBlur"
        }
    }

    internal func setOptions(filter: inout CIFilter) {
        switch self {
        case let .Box(radius):
            filter.apply(value: radius, forKey: .Radius)
        }
    }

}
