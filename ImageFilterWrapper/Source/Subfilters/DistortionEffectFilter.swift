//
//  DistortionEffectFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/25/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum DistortionEffectFilter {

    /**
     Creates a bump that originates at a specified point in the image.
     
     The bump can be concave or convex.
     */
    case BumpDistortion(center: CGPoint?, radius: Float?, scale: Float?)

    /**
     Creates a concave or convex distortion that originates from a line in the image.
     */
    case BumpDistortionLinear(
        center: CGPoint?,
        radius: Float?,
        angle: Float?,
        scale: Float?
    )

    /**
     Distorts the pixels starting at the circumference of a circle and emanating outward.
     */
    case CircleSplashDistortion(center: CGPoint?, radius: Float?)

    /**
     Wraps an image around a transparent circle.
     
     The distortion of the image increases with the distance from the center of the circle.
     */
    case CircularWrap(center: CGPoint?, radius: Float?, angle: Float?)

    /**
     Recursively draws a portion of an image in imitation of an M.C. Escher drawing.
     */
    case Droste(
        insetPoint0: CGPoint?,
        insetPoint1: CGPoint?,
        strands: Float?,
        periodicity: Float?,
        rotation: Float?,
        zoom: Float?
    )

    /**
     Applies the grayscale values of the second image to the first image.
     
     The output image has a texture defined by the grayscale values.
     */
    case DisplacementDistortion(displacementImage: UIImage, scale: Float?)

    /**
     Distorts an image by applying a glass-like texture.
     
     The raised portions of the output image are the result of applying a texture map.
     */
    case GlassDistortion(texture: UIImage, center: CGPoint?, scale: Float?)

    /**
     Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is
     placed.
     */
    case GlassLozenge(
        point0: CGPoint?,
        point1: CGPoint?,
        radius: Float?,
        refraction: Float?
    )

    /**
     Creates a circular area that pushes the image pixels outward, distorting those pixels closest
     to the circle the most.
     */
    case HoleDistortion(center: CGPoint?, radius: Float?)

    /**
     Rotates a portion of the input image specified by the center and radius parameters to give a
     tunneling effect.
     */
    case LightTunnel(center: CGPoint?, rotation: Float?, radius: Float?)

    /**
     Creates a rectangular area that pinches source pixels inward, distorting those pixels closest
     to the rectangle the most.
     */
    case PinchDistortion(center: CGPoint?, radius: Float?, scale: Float?)

    /**
     Distorts an image by stretching and / or cropping it to fit a target size.
     - `size`: Specifies the size of the output image in pixels.
     - `cropAmount`: Determines if, and how much, cropping should be used to achieve the target
     size. If the value is 0, the image is stretched but not cropped. If the value is 1, the image
     is cropped but not stretched. Values in-between use stretching and cropping proportionally.
     - `centerStretchAmount`: Determines how much stretching to apply to the center of the image, if
     stretching is indicated by the `cropAmount` value. A value of 0 causes the center of the image
     to maintain its original aspect ratio. A value of 1 causes the image to be stretched uniformly.
     */
    case StretchCrop(
        size: CGSize,
        cropAmount: Float,
        centerStretchAmount: Float
    )

    /**
     Creates a torus-shaped lens and distorts the portion of the image over which the lens is
     placed.
     */
    case TorusLensDistortion(
        center: CGPoint?,
        radius: Float?,
        width: Float?,
        refraction: Float?
    )

    /**
     Rotates pixels around a point to give a twirling effect.
     
     You can specify the number of rotations as well as the center and radius of the effect.
     */
    case TwirlDistortion(center: CGPoint?, radius: Float?, angle: Float?)

    /**
     Rotates pixels around a point to simulate a vortex.
     
     You can specify the number of rotations as well as the center and radius of the effect.
     */
    case VortexDistortion(center: CGPoint?, radius: Float?, angle: Float?)

}

extension DistortionEffectFilter: Subfilter {

    public var key: String {
        switch self {
        case .BumpDistortion: return "CIBumpDistortion"
        case .BumpDistortionLinear: return "CIBumpDistortionLinear"
        case .CircleSplashDistortion: return "CICircleSplashDistortion"
        case .CircularWrap: return "CICircularWrap"
        case .Droste: return "CIDroste"
        case .DisplacementDistortion: return "CIDisplacementDistortion"
        case .GlassDistortion: return "CIGlassDistortion"
        case .GlassLozenge: return "CIGlassLozenge"
        case .HoleDistortion: return "CIHoleDistortion"
        case .LightTunnel: return "CILightTunnel"
        case .PinchDistortion: return "CIPinchDistortion"
        case .StretchCrop: return "CIStretchCrop"
        case .TorusLensDistortion: return "CITorusLensDistortion"
        case .TwirlDistortion: return "CITwirlDistortion"
        case .VortexDistortion: return "CIVortexDistortion"
        }
    }

    public func setFilterOptions(filter: inout CIFilter) {
        switch self {

        case let .BumpDistortion(center, radius, scale):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (scale, .Scale))

        case let .BumpDistortionLinear(center, radius, angle, scale):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (angle, .Angle),
                              (scale, .Scale))

        case let .CircleSplashDistortion(center, radius):
            filter.setOptions((center, .Center),
                              (radius, .Radius))

        case let .CircularWrap(center, radius, angle):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (angle, .Angle))

        case let .Droste(insetPoint0, insetPoint1, strands, periodicity, rotation, zoom):
            filter.setOptions((insetPoint0, .InsetPoint0),
                              (insetPoint1, .InsetPoint1),
                              (strands, .Strands),
                              (periodicity, .Periodicity),
                              (rotation, .Rotation),
                              (zoom, .Zoom))

        case let .DisplacementDistortion(displacementImage, scale):
            filter.setOptions((displacementImage, .DisplacementImage),
                              (scale, .Scale))

        case let .GlassDistortion(texture, center, scale):
            filter.setOptions((texture, .Texture),
                              (center, .Center),
                              (scale, .Scale))

        case let .GlassLozenge(point0, point1, radius, refraction):
            filter.setOptions((point0, .Point0),
                              (point1, .Point1),
                              (radius, .Radius),
                              (refraction, .Refraction))

        case let .HoleDistortion(center, radius):
            filter.setOptions((center, .Center),
                              (radius, .Radius))

        case let .LightTunnel(center, rotation, radius):
            filter.setOptions((center, .Center),
                              (rotation, .Rotation),
                              (radius, .Radius))

        case let .PinchDistortion(center, radius, scale):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (scale, .Scale))

        case let .StretchCrop(size, cropAmount, centerStretchAmount):
            filter.setOptions((size, .Size),
                              (cropAmount, .CropAmount),
                              (centerStretchAmount, .CenterStretchAmount))

        case let .TorusLensDistortion(center, radius, width, refraction):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (width, .Width),
                              (refraction, .Refraction))

        case let .TwirlDistortion(center, radius, angle):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (angle, .Angle))

        case let .VortexDistortion(center, radius, angle):
            filter.setOptions((center, .Center),
                              (radius, .Radius),
                              (angle, .Angle))
        }
    }
}
