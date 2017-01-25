//
//  BlurFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

/**
 A filter that softens images, decreasing the contrast between the edges in an image.

 Possible filters are:

 ````
 case Box
 case Disc
 case Gaussian
 case MaskedVariable
 case MedianFilter
 case Motion
 case NoiseReduction
 case Zoom
 ````
 */
public enum BlurFilter {

    /**
     Blurs an image using a box-shaped convolution kernel.
     */
    case Box(radius: Float?)

    /**
     Blurs an image using a disc-shaped convolution kernel.
     */
    case Disc(radius: Float?)

    /**
     Spreads source pixels by an amount specified by a Gaussian distribution.
     */
    case Gaussian(radius: Float?)

    /**
     Blurs the source image according to the brightness levels in a mask image.

     Shades of gray in the mask image vary the blur radius from zero (where the mask image is black)
     to the radius specified in the `radius` parameter (where the mask image is white).
     */
    case MaskedVariable(mask: UIImage?, radius: Float?)

    /**
     Computes the median value for a group of neighboring pixels and replaces each pixel value with
     the median.

     The effect is to reduce noise.
     */
    case MedianFilter

    /**
     Blurs an image to simulate the effect of using a camera that moves a specified angle and
     distance while captuing the image.
     */
    case Motion(radius: Float?, angle: Float?)

    /**
     Reduces noise using a threshold value to define what is considered noise.

     Small changes in luminance below that value are considered noise and get a noise reduction
     treatment, which is a local blur. Changes above the threshold value are considered edges, so
     they are sharpened.
     */
    case NoiseReduction(noiseLevel: Float?, sharpness: Float?)

    /**
     Simulates the effect of zooming the camera while capturing the image.
     */
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
