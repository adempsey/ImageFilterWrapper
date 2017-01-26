
//
//  Filter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum ImageFilter {

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
    case Blur(BlurFilter)

    /**
     A filter that changes color values. Color adjustment filters are used to eliminate color casts,
     adjust hue, and correct brightness and contrast. Color adjustment filters do not perform color
     management; ColorSync performs color management. You can use Quartz 2D to specify the color space
     associated with an image. For more information, see
     [Color Management Overview
     ](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/csintro/csintro_intro/csintro_intro.html#//apple_ref/doc/uid/TP30001148)
     and [Quartz 2D Programming Guide
     ](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066).

     Possible filters are:
     ````
     case ColorClamp
     case ColorControls
     case ColorMatrix
     case ColorPolynomial
     case ExposureAdjust
     case GammaAdjust
     case HueAdjust
     case LinearToSRGBToneCurve
     case SRGBToneCurveToLinear
     case TemperatureAndTint
     case ToneCurve
     case Vibrance
     case WhitePointAdjust
     ````
     */
    case ColorAdjustment(ColorAdjustmentFilter)

    /**
     A filter that modifies the color of an image to achieve an artistic effect. Examples of color
     effect filters include filters that change a color image to a sepia image or a monochrome image
     or that produces such effects as posterizing.

     Possible filters are:
     ````
     case ColorCrossPolynomial
     case ColorCube
     case ColorCubeWithColorSpace
     case ColorInvert
     case ColorMap
     case ColorMonochrome
     case ColorPosterize
     case FalseColor
     case MaskToAlpha
     case MaximumComponent
     case MinimumComponent
     case PhotoEffectChrome
     case PhotoEffectFade
     case PhotoEffectInstant
     case PhotoEffectMono
     case PhotoEffectNoir
     case PhotoEffectProcess
     case PhotoEffectTonal
     case PhotoEffectTransfer
     case SepiaTone
     case Vignette
     case VignetteEffect
     ````
     */
    case ColorEffect(ColorEffectFilter)

    /**
     A filter that operates on two image sources, using the color values of one image to operate
     on the other. Composite filters perform computations such as computing maximum values,
     minimum values, and multiplying values between input images. You can use compositing filters to
     add effects to an image, crop an image, and achieve a variety of other effects.

     Possible filters are:
     ````
     case AdditionCompositing
     case ColorBlendMode
     case ColorBurnBlendMode
     case ColorDodgeBlendMode
     case DarkenBlendMode
     case DifferenceBlendMode
     case DivideBlendMode
     case ExclusionBlendMode
     case HardLightBlendMode
     case HueBlendMode
     case LightenBlendMode
     case LinearBurnBlendMode
     case LinearDodgeBlendMode
     case LuminosityBlendMode
     case MaximumCompositing
     case MinimumCompositing
     case MultiplyBlendMode
     case MultiplyCompositing
     case OverlayBlendMode
     case PinLightBlendMode
     case SaturationBlendMode
     case ScreenBlendMode
     case SoftLightBlendMode
     case SourceAtopCompositing
     case SourceInCompositing
     case SourceOutCompositing
     case SourceOverCompositing
     case SubtractBlendMode
     ````
     */
    case CompositeOperation(CompositeOperationFilter)

    /**
     A filter that sharpens images, increasing the contrast between the edges in an image.

     Possible filters are:

     ````
     case SharpenLuminance
     case UnsharpMask
     ````
     */
    case Sharpen(SharpenFilter)

    internal var subfilter: Subfilter {
        switch self {
        case let .Blur(subfilter):
            return subfilter
        case let .ColorAdjustment(subfilter):
            return subfilter
        case let .ColorEffect(subfilter):
            return subfilter
        case let .CompositeOperation(subfilter):
            return subfilter
        case let .Sharpen(subfilter):
            return subfilter
        }
    }


}

extension CIFilter {

    /**
     Applies a set of configuration parameters to the current image filter.

     - Parameter options: A set of tuples, where each tuple contains a key value pair. The key
     must correspond to an enumerated `FilterOption`, and the value's type should match the
     specification in the CIFilter documentation for the given parameter. Options are applied in
     the given order.
     */
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
