//
//  BlurFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum BlurFilter {
    case Box(radius: Float?)
    case Disc(radius: Float?)
    case Gaussian(radius: Float?)
    case MaskedVariable(mask: UIImage?, radius: Float?)
    case MedianFilter
    case Motion(radius: Float?, angle: Float?)
    case NoiseReduction(noiseLevel: Float?, sharpness: Float?)
    case Zoom(center: CGPoint?, amount: Float?)
}

extension BlurFilter: Subfilter {

    internal var key: String {
        switch self {
        case .Box: return "CIBoxBlur"
        case .Disc: return "CIDiscBlur"
        case .Gaussian: return "CIGaussianBlur"
        case .MaskedVariable: return "CIMaskedVariableBlur"
        case .MedianFilter: return "CIMaskedVariableBlur"
        case .Motion: return "CIMotionBlur"
        case .NoiseReduction: return "CINoiseReduction"
        case .Zoom: return "CIZoomBlur"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .Box(radius):
            filter.setOptions((radius, .Radius))

        case let .Disc(radius):
            filter.setOptions((radius, .Radius))

        case let .Gaussian(radius):
            filter.setOptions((radius, .Radius))

        case let .MaskedVariable(mask, radius):
            filter.setOptions((mask, .Mask),
                              (radius, .Radius))

        case let .Motion(radius, angle):
            filter.setOptions((radius, .Radius),
                              (angle, .Angle))

        case let .NoiseReduction(noiseLevel, sharpness):
            filter.setOptions((noiseLevel, .NoiseLevel),
                              (sharpness, .Sharpness))

        case let .Zoom(center, amount):
            filter.setOptions((center, .Center),
                              (amount, .Amount))

        default:
            break
        }
    }

}
