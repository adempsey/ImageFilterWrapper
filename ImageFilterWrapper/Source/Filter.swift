
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
     A filter that reshapes an image by altering its geometry to create a 3D effect. Using
     distortion filters, you can displace portions of an image, apply lens effects, make a bulge in
     an image, and perform other operations to achieve an artistic effect.
     
     Possible filters are:
     ````
     case BumpDistortion
     case BumpDistortionLinear
     case CircleSplashDistortion
     case CircularWrap
     case Droste
     case DisplacementDistortion
     case GlassDistortion
     case GlassLozenge
     case HoleDistortion
     case LightTunnel
     case PinchDistortion
     case StretchCrop
     case TorusLensDistortion
     case TwirlDistortion
     case VortexDistortion
     ````
     */
    case DistortionEffect(DistortionEffectFilter)

    /**
     A filter that sharpens images, increasing the contrast between the edges in an image.

     Possible filters are:

     ````
     case SharpenLuminance
     case UnsharpMask
     ````
     */
    case Sharpen(SharpenFilter)

    /**
     A filter that makes a photographic image look as if it was painted or sketched. These filters
     are typically used alone or in combination with other filters to achieve artistic effects.
     
     Possible filters are:

     ````
     case BlendWithAlphaMask
     case BlendWithMask
     case Bloom
     case ComicEffect
     case Convolution3x3
     case Convolution5x5
     case Convolution7x7
     case Convolution9Horizontal
     case Convolution9Vertical
     case Crystallize
     case DepthOfField
     case Edges
     case EdgeWork
     case Gloom
     case HeightFieldFromMask
     case HexagonalPixellate
     case HighlightShadowAdjust
     case LineOverlay
     case Pixellate
     case Pointillize
     case ShadedMaterial
     case SpotColor
     case Spotlight
     ````
     */
    case Stylize(StylizeFilter)

    /**
     A filter that typically applies an effect to an image and then creates smaller versions of the
     image (tiles), which are then laid out to create a pattern that's infinite in extent.
     
     Possible filters are:

     ````
     case AffineClamp
     case AffineTile
     case EightfoldReflectedTile
     case FourfoldReflectedTile
     case FourfoldRotatedTile
     case FourfouldTranslatedTile
     case GlideReflectedTile
     case Kaleidoscope
     case OpTile
     case ParallelogramTile
     case PerspectiveTile
     case SixfoldReflectedTile
     case SixfoldRotatedTile
     case TriangleKaleidoscope
     case TriangleTile
     case TwelvefoldReflectedTile
     ````
     */
    case TileEffect(TileEffectFilter)

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
        case let .DistortionEffect(subfilter):
            return subfilter
        case let .Sharpen(subfilter):
            return subfilter
        case let .Stylize(subfilter):
            return subfilter
        case let .TileEffect(subfilter):
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
