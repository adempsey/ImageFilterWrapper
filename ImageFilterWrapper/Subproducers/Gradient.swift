//
//  Gradient.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

public enum GradientProducer {

    /**
     Generates a gradient that varies from one color to another using a Gaussian distribution.
     */
    case Gaussian(center: CGPoint?,
                  color0: UIColor,
                  color1: UIColor,
                  radius: Float?)

    /**
     Generates a gradient that varies along a linear axis between two defined endpoints.
     */
    case Linear(point0: CGPoint?,
                point1: CGPoint?,
                color0: UIColor,
                color1: UIColor)

    /**
     Generates a gradient that varies radially between two circles having the same center.
     */
    case Radial(center: CGPoint?,
                radius0: Float?,
                radius1: Float?,
                color0: UIColor,
                color1: UIColor)

    /**
     Generates a gradient that uses an S-curve function to blend colors along a linear axis between
     two defined endpoints.
     */
    case SmoothLinear(point0: CGPoint?,
                      point1: CGPoint?,
                      color0: UIColor,
                      color1: UIColor)

}

extension GradientProducer: Subfilter {

    internal var key: String {
        switch self {
        case .Gaussian: return "CIGaussianGradient"
        case .Linear: return "CILinearGradient"
        case .Radial: return "CIRadialGradient"
        case .SmoothLinear: return "CISmoothLinearGradient"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .Gaussian(center, color0, color1, radius):
            filter.setOptions((center, .Center),
                              (color0, .Color0),
                              (color1, .Color1),
                              (radius, .Radius))

        case let .Linear(point0, point1, color0, color1):
            filter.setOptions((point0, .Point0),
                              (point1, .Point1),
                              (color0, .Color0),
                              (color1, .Color1))

        case let .Radial(center, radius0, radius1, color0, color1):
            filter.setOptions((center, .Center),
                              (radius0, .Radius0),
                              (radius1, .Radius1),
                              (color0, .Color0),
                              (color1, .Color1))

        case let .SmoothLinear(point0, point1, color0, color1):
            filter.setOptions((point0, .Point0),
                              (point1, .Point1),
                              (color0, .Color0),
                              (color1, .Color1))
        }
    }

}
