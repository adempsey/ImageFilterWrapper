//
//  ColorAdjustmentFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/24/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

/**
 A filter that changes color values. Color adjustment filters are used to eliminate color casts,
 adjust hue, and correct brightness and contrast. Color adjustment filters do not perform color
 management; ColorSync performs color management. You can use Quartz 2D to specify the color space
 associated with an image. For more information, see
 [Color Management Overview](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/csintro/csintro_intro/csintro_intro.html#//apple_ref/doc/uid/TP30001148)
 and [Quartz 2D Programming Guide](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066).
 
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
public enum ColorAdjustmentFilter {

    /**
     Modifies color values to keep them within a specified range.
     
     At each pixel, color component values less than those in `minComponents` will be increased to
     match those in `minComponents`, and color component values greater than those in
     `maxComponents` will be decreased to match those in `maxComponents`.
     */
    case ColorClamp(
        minComponents: (r: Float, g: Float, b: Float, a: Float)?,
        maxComponents: (r: Float, g: Float, b: Float, a: Float)?
    )

    /**
     Adjusts saturation, brightness, and contrast values.
     
     To calculate saturation, this filter linearly interpolates between a grayscale image
     (saturation = `0.0`) and the original image (saturation = `1.0`). The filter supports
     extrapolation: For values larger than `1.0`, it increases saturation.
     
     To calculate contrast, this filter uses the following formula:
     ````
     (color.rgb - vec3(0.5)) * contrast + vec3(0.5)
     ````
     
     This filter calculates brightness by adding a bias value:
     ````
     color.rgb + vec3(brightness)
     ````
     */
    case ColorControls(
        saturation: Float?,
        brightness: Float?,
        contrast: Float?
    )

    /**
     Multiplies source color values and adds a bias factor to each color component.
     
     This filter performs a matrix multiplication, as follows, to transform the color vector:
     ````
     s.r = dot(s, redVector)
     s.g = dot(s, greenVector)
     s.b = dot(s, blueVector)
     s.a = dot(s, alphaVector)
     s = s + bias
     ````
     
     - Note: As with all color filters, this operation is performed in the working color space of
     the Core Image context executing the filter, using unpremultiplied pixel color values. If you
     see unexpected results, verify that your output and working color spaces are set up as
     intended.
     */
    case ColorMatrix(
        r: (x: Float, y: Float, z: Float, w: Float)?,
        g: (x: Float, y: Float, z: Float, w: Float)?,
        b: (x: Float, y: Float, z: Float, w: Float)?,
        a: (x: Float, y: Float, z: Float, w: Float)?,
        bias: (x: Float, y: Float, z: Float, w: Float)?
    )

    /**
     Modifies the pixel values in an image by applying a set of cubic polynomials.
     
     For each pixel, the value of each color component is treated as the input to a cubic
     polynomial, whose coefficients are taken from the corresponding parameter in ascending order.
     Equivalent to the following formula:
     ````
     r = c0 + c1*r + c2*r*r + c3*r*r*r
     g = c0 + c1*g + c2*g*g + c3*g*g*g
     b = c0 + c1*b + c2*b*b + c3*b*b*b
     a = c0 + c1*a + c2*a*a + c3*a*a*a
     ````

     - Note: As with all color filters, this operation is performed in the working color space of
     the Core Image context executing the filter, using unpremultiplied pixel color values. If you
     see unexpected results, verify that your output and working color spaces are set up as
     intended.
     */
    case ColorPolynomial(
        r: (c: Float, r: Float, rr: Float, rrr: Float)?,
        g: (c: Float, g: Float, gg: Float, ggg: Float)?,
        b: (c: Float, b: Float, bb: Float, bbb: Float)?,
        a: (c: Float, a: Float, aa: Float, aaa: Float)?
    )

    /**
     Adjusts the exposure setting for an image similar to the way you control exposure for a camera
     when you change th F-stop.
     
     This filter multiplies the color values, as follows, to simulate exposure change by the
     specified F-stops:
     ````
     s.rgb * pow(2.0, ev)
     ````
     */
    case ExposureAdjust(EV: Float?)

    /**
     Adjusts midtone brightness.
     
     This filter is typically used to compensate for nonlinear effects of displays. Adjusting the
     gamma effectively changes the slope of the transition between black and white. It uses the
     following formula:
     ````
     pow(s.rgb, vec3(power))
     ````

     - Note: As with all color filters, this operation is performed in the working color space of
     the Core Image context executing the filter, using unpremultiplied pixel color values. If you
     see unexpected results, verify that your output and working color spaces are set up as
     intended.
     */
    case GammaAdjust(power: Float?)

    /**
     Changes the overall hue, or tint, of the source pixels.
     
     This filter essentially rotates the color cube around the neutral axis.
     */
    case HueAdjust(angle: Float?)

    /**
     Maps color intensity from a linear gamma curve to the sRGB color space.
     */
    case LinearToSRGBToneCurve

    /**
     Maps color intensity from the sRGB color space to a linear gamma curve.
     */
    case SRGBToneCurveToLinear

    /**
     Adapts the reference white point for an image.
     */
    case TemperatureAndTint(
        neutral: (temperature: Float, tint: Float)?,
        targetNeutral: (temperature: Float, tint: Float)?
    )

    /**
     Adjusts tone responses for the R, G, and B channels of an image.
     
     The input points are five `(x, y)` values that are interpolated using a spline curve. The
     curve is applied in a perceptual (gamma 2) version of the working space.
     */
    case ToneCurve(
        point0: (tone: Float, lightness: Float)?,
        point1: (tone: Float, lightness: Float)?,
        point2: (tone: Float, lightness: Float)?,
        point3: (tone: Float, lightness: Float)?,
        point4: (tone: Float, lightness: Float)?
    )

    /**
     Adjusts the saturation of an image while keeping pleasing skin tones.
     */
    case Vibrance(amount: Float?)

    /**
     Adjusts the reference white point for an image and maps all colors in the source using the new
     reference.
     */
    case WhitePointAdjust(color: UIColor?)
}

extension ColorAdjustmentFilter: Subfilter {

    internal var key: String {
        switch self {
        case .ColorClamp: return "CIColorClamp"
        case .ColorControls: return "CIColorControls"
        case .ColorMatrix: return "CIColorMatrix"
        case .ColorPolynomial: return "CIColorPolynomial"
        case .ExposureAdjust: return "CIExposureAdjust"
        case .GammaAdjust: return "CIGammaAdjust"
        case .HueAdjust: return "CIHueAdjust"
        case .LinearToSRGBToneCurve: return "CILinearToSRGBToneCurve"
        case .SRGBToneCurveToLinear: return "CISRGBToneCurveToLinear"
        case .TemperatureAndTint: return "CITemperatureAndTint"
        case .ToneCurve: return "CIToneCurve"
        case .Vibrance: return "CIVibrance"
        case .WhitePointAdjust: return "CIWhitePointAdjust"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .ColorClamp(minComponents, maxComponents):
            filter.setOptions((minComponents, .MinComponents),
                              (maxComponents, .MaxComponents))

        case let .ColorControls(saturation, brightness, contrast):
            filter.setOptions((saturation, .Saturation),
                              (brightness, .Brightness),
                              (contrast, .Contrast))

        case let .ColorMatrix(r, g, b, a, bias):
            filter.setOptions((r, .RVector),
                              (g, .GVector),
                              (b, .BVector),
                              (a, .AVector),
                              (bias, .BiasVector))

        case let .ColorPolynomial(r, g, b, a):
            filter.setOptions((r, .RedCoefficients),
                              (g, .GreenCoefficients),
                              (b, .BlueCoefficients),
                              (a, .AlphaCoefficients))

        case let .ExposureAdjust(EV):
            filter.setOptions((EV, .EV))

        case let .GammaAdjust(power):
            filter.setOptions((power, .Power))

        case let .HueAdjust(angle):
            filter.setOptions((angle, .Angle))

        case let .TemperatureAndTint(neutral, targetNeutral):
            filter.setOptions((neutral, .Neutral),
                              (targetNeutral, .TargetNeutral))

        case let .ToneCurve(point0, point1, point2, point3, point4):
            filter.setOptions((point0, .Point0),
                              (point1, .Point1),
                              (point2, .Point2),
                              (point3, .Point3),
                              (point4, .Point4))

        case let .Vibrance(amount):
            filter.setOptions((amount, .Amount))

        case let .WhitePointAdjust(color):
            filter.setOptions((color, .Color))

        default:
            break
        }
    }
}
