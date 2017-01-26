//
//  SharpenFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/23/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum SharpenFilter {

    /**
     Increases image detail by sharpening.

     It operates on the luminance of the image; the chrominance of the pixels remains unaffected.
     */
    case SharpenLuminance(sharpness: Float?)

    /**
     Increases the contrast of the edges between pixels of different colors in an image.
     */
    case UnsharpMask(radius: Float?, intensity: Float?)
}

extension SharpenFilter: Subfilter {

    internal var key: String {
        switch self {
        case .SharpenLuminance: return "CISharpenLuminance"
        case .UnsharpMask: return "CIUnsharpMask"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .SharpenLuminance(sharpness):
            filter.setOptions((sharpness, .Sharpness))

        case let .UnsharpMask(radius, intensity):
            filter.setOptions((radius, .Radius),
                              (intensity, .Intensity))
        }
    }

}
