//
//  CompositeOperationFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/25/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum CompositeOperationFilter {

    /**
     Adds color components to achieve a brightening effect.

     This filter is typically used to add highlights and lens flare effects. The formula used to
     create this filter is described in Thomas Porter and Tom Duff. 1984.
     [Compositing Digital Images](http://keithp.com/~keithp/porterduff/p253-porter.pdf).
     _Computer Graphics_, 18 (3): 253-259.
     */
    case AdditionCompositing(backgroundImage: UIImage)

    /**
     Uses the luminance values of the background with the hue and saturation values of the source
     image.

     This mode preserves the gray levels in the image. The formula used to create this filter is
     described in the PDF specification, which is available online from the Adobe Developer Center.
     See [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case ColorBlendMode(backgroundImage: UIImage)

    /**
     Darkens the background image samples to reflect the source image samples.

     Source image sample values that specify white do not produce a change. The formula used to
     create this filter is described in the PDF specification, which is available online from the
     Adobe Developer Center. See 
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case ColorBurnBlendMode(backgroundImage: UIImage)

    /**
     Brightens the background image samples to reflect the source image samples.

     Source image sample values that specify black do not produce a change. The formula used to
     create this filter is described in the PDF specification, which is available online from the
     Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case ColorDodgeBlendMode(backgroundImage: UIImage)

    /**
     Creates composite image samples by choosing the darker samples (from either the source image or
     the background).

     The result is that the background image samples are replaced by any source image samples that
     are darker. Otherwise, the background image samples are left unchanged. The formula used to
     create this filter is described in the PDF specification, which is available online from the
     Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case DarkenBlendMode(backgroundImage: UIImage)

    /**
     Subtracts either the source image sample color from the background image sample color, or the
     reverse, depending on which sample has the greater brightness value.

     Source image sample values that are black produce no change; white inverts the background color
     values. The formula used to create this filter is described in the PDF specification, which is
     available online from the Adobe Developer Center. See 
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case DifferenceBlendMode(backgroundImage: UIImage)

    /**
     Divides the background image sample color from the source image sample color.
     */
    case DivideBlendMode(backgroundImage: UIImage)

    /**
     Produces an effect similar to that produced by the DifferenceBlendMode filter but with lower
     contrast.

     Source image sample values that are black do not produce a change; white inverts the background 
     color values. The formula used to create this filter is described in the PDF specification, 
     which is available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case ExclusionBlendMode(backgroundImage: UIImage)

    /**
     Either multiplies or screens colors, depending on the source image sample color.

     If the source image sample color is lighter than 50% gray, the background is lightened, similar
     to screening. If the source image sample color is darker than 50% gray, the background is
     darkened, similar to multiplying. If the source image sample color is equal to 50% gray, the 
     source image is not changed. Image samples that are equal to pure black or pure white result in
     pure black or white. The overall effect is similar to what you would achieve by shining a harsh
     spotlight on the source image. The formula used to create this filter is described in the PDF
     specification, which is available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case HardLightBlendMode(backgroundImage: UIImage)

    /**
     Uses the luminance and saturation values of the background image with the hue of the input 
     image.

     The formula used to create this filter is described in the PDF specification, which is 
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case HueBlendMode(backgroundImage: UIImage)

    /**
     Creates composite image samples by choosing the lighter samples (either from the source image
     or the background).

     The result is that the background image samples are replaced by any source image samples that
     are lighter. Otherwise, the background image samples are left unchanged. The formula used to 
     create this filter is described in the PDF specification, which is available online from the
     Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case LightenBlendMode(backgroundImage: UIImage)

    /**
     Darkens the background image samples to reflect the source image samples while also increasing
     contrast.

     The effect of this filter is similar to that of the ColorBurnBlendMode filter, but more
     pronounced.
     */
    case LinearBurnBlendMode(backgroundImage: UIImage)

    /**
     Brightens the background image samples to reflect the source image samples while also 
     increasing contrast.

     The effect of this filter is similar to that of the ColorDodgeBlendMode filter, but more
     pronounced.
     */
    case LinearDodgeBlendMode(backgroundImage: UIImage)

    /**
     Uses the hue and saturation of the background image with the luminance of the input image.

     This mode creates an effect that is inverse to the effect created by the ColorBlendMode filter.
     The formula used to create this filter is described in the PDF specification, which is 
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case LuminosityBlendMode(backgroundImage: UIImage)

    /**
     Computes the maximum value, by color component, of two input images and creates an output
     image using the maximum values.

     This is similar to dodging. The formula used to create this filter is described in Thomas 
     Porter and Tom Duff. 1984. [Compositing Digital Images
     ](http://keithp.com/~keithp/porterduff/p253-porter.pdf). _Computer Graphics_, 18 (3): 253-259.
     */
    case MaximumCompositing(backgroundImage: UIImage)

    /**
     Computes the minimum value, by color component, of two input images and creates an output image
     using the minimum values.

     This is similar to burning. The formula used to create this filter is described in Thomas
     Porter and Tom Duff. 1984. [Compositing Digital Images
     ](http://keithp.com/~keithp/porterduff/p253-porter.pdf). _Computer Graphics_, 18 (3): 253-259.
     */
    case MinimumCompositing(backgroundImage: UIImage)

    /**
     Multiplies the input image samples with the background image samples.

     This results in colors that are at least as dark as either of the two contributing sample
     colors. The formula used to create this filter is described in the PDF specification, which is
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case MultiplyBlendMode(backgroundImage: UIImage)

    /**
     Multiplies the color component of two input images and creates an output image using the
     multiplied values.

     This filter is typically used to add a spotlight or similar lighting effect to an image.
     The formula used to create this filter is described in the PDF specification, which is
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case MultiplyCompositing(backgroundImage: UIImage)

    /**
     Either multiplies or screens the input image samples with the background image samples,
     depending on the background color.

     The result is to overlay the existing image samples while preserving the highlights and shadows
     of the background. The background color mixes with the source image to reflect the lightness
     or darkness of the background. The formula used to create this filter is described in the PDF 
     specification, which is available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case OverlayBlendMode(backgroundImage: UIImage)

    /**
     Conditionally replaces background image samples with source image samples depending on the
     brightness of the source image samples.
     */
    case PinLightBlendMode(backgroundImage: UIImage)

    /**
     Uses the luminance and hue values of the background image with the saturation of the input
     image.

     Areas of the background that have no saturation (that is, pure gray areas) do not produce a
     change. The formula used to create this filter is described in the PDF specification, which is 
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case SaturationBlendMode(backgroundImage: UIImage)

    /**
     Multiplies the inverse of the input image samples with the inverse of the background image
     samples.

     This results in colors that are at least as light as either of the two contributing sample
     colors. The formula used to create this filter is described in the PDF specification, which is
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case ScreenBlendMode(backgroundImage: UIImage)

    /**
     Either darkens or lightens colors, depending on the input image sample color.

     If the source image sample color is lighter than 50% gray, the background is lightened, similar
     to dodging. If the source image sample color is darker than 50% gray, the background is 
     darkened, similar to burning. If the source image sample color is equal to 50% gray, the
     background is not changed. Image samples that are equal to pure black or pure white produce 
     darker or lighter areas, but do not result in pure black or white. The overall effect is 
     similar to what you would achieve by shining a diffuse spotlight on the source image. The 
     formula used to create this filter is described in the PDF specification, which is 
     available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case SoftLightBlendMode(backgroundImage: UIImage)

    /**
     Places the input image over the background image, then uses the luminance of the background
     image to determine what to show.

     The composite shows the background image and only those portions of the source image that are
     over visible parts of the background. The formula used to create this filter is described in 
     the PDF specification, which is available online from the Adobe Developer Center. See
     [PDF Reference and Adobe Extensions to the PDF Specification
     ](http://www.adobe.com/devnet/pdf/pdf_reference.html).
     */
    case SourceAtopCompositing(backgroundImage: UIImage)

    /**
     Uses the background image to define what to leave in the input image, effectively cropping the
     input image.

     The formula used to create this filter is described in Thomas Porter and Tom Duff. 1984. 
     [Compositing Digital Images
     ](http://keithp.com/~keithp/porterduff/p253-porter.pdf). _Computer Graphics_, 18 (3): 253-259.
     */
    case SourceInCompositing(backgroundImage: UIImage)

    /**
     Uses the background image to define what to take out of the input image.

     The formula used to create this filter is described in Thomas Porter and Tom Duff. 1984.
     [Compositing Digital Images
     ](http://keithp.com/~keithp/porterduff/p253-porter.pdf). _Computer Graphics_, 18 (3): 253-259.
     */
    case SourceOutCompositing(backgroundImage: UIImage)

    /**
     Places the input image over the input background image.

     The formula used to create this filter is described in Thomas Porter and Tom Duff. 1984.
     [Compositing Digital Images
     ](http://keithp.com/~keithp/porterduff/p253-porter.pdf). _Computer Graphics_, 18 (3): 253-259.
     */
    case SourceOverCompositing(backgroundImage: UIImage)

    /**
     Subtracts the background image sample color from the source image sample color.
     */
    case SubtractBlendMode(backgroundImage: UIImage)

}

extension CompositeOperationFilter: Subfilter {

    internal var key: String {
        switch self {
        case .AdditionCompositing: return "CIAdditionCompositing"
        case .ColorBlendMode: return "CIColorBlendMode"
        case .ColorBurnBlendMode: return "CIColorBurnBlendMode"
        case .ColorDodgeBlendMode: return "CIColorDodgeBlendMode"
        case .DarkenBlendMode: return "CIDarkenBlendMode"
        case .DifferenceBlendMode: return "CIDifferenceBlendMode"
        case .DivideBlendMode: return "CIDivideBlendMode"
        case .ExclusionBlendMode: return "CIExclusionBlendMode"
        case .HardLightBlendMode: return "CIHardLightBlendMode"
        case .HueBlendMode: return "CIHueBlendMode"
        case .LightenBlendMode: return "CILightenBlendMode"
        case .LinearBurnBlendMode: return "CILinearBurnBlendMode"
        case .LinearDodgeBlendMode: return "CILinearDodgeBlendMode"
        case .LuminosityBlendMode: return "CILuminosityBlendMode"
        case .MaximumCompositing: return "CIMaximumCompositing"
        case .MinimumCompositing: return "CIMinimumCompositing"
        case .MultiplyBlendMode: return "CIMultiplyBlendMode"
        case .MultiplyCompositing: return "CIMultiplyCompositing"
        case .OverlayBlendMode: return "CIOverlayBlendMode"
        case .PinLightBlendMode: return "CIPinLightBlendMode"
        case .SaturationBlendMode: return "CISaturationBlendMode"
        case .ScreenBlendMode: return "CIScreenBlendMode"
        case .SoftLightBlendMode: return "CISoftLightBlendMode"
        case .SourceAtopCompositing: return "CISourceAtopCompositing"
        case .SourceInCompositing: return "CISourceInCompositing"
        case .SourceOutCompositing: return "CISourceOutCompositing"
        case .SourceOverCompositing: return "CISourceOverCompositing"
        case .SubtractBlendMode: return "CISubtractBlendMode"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .AdditionCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .ColorBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .ColorBurnBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .ColorDodgeBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .DarkenBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .DifferenceBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .DivideBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .ExclusionBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .HardLightBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .HueBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .LightenBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .LinearBurnBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .LinearDodgeBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .LuminosityBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .MaximumCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .MinimumCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .MultiplyBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .MultiplyCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .OverlayBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .PinLightBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SaturationBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .ScreenBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SoftLightBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SourceAtopCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SourceInCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SourceOutCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SourceOverCompositing(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        case let .SubtractBlendMode(backgroundImage):
            filter.setOptions((backgroundImage, .BackgroundImage))

        }
    }

}
