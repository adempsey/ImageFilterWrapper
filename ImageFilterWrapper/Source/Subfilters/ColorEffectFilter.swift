//
//  ColorEffectFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/24/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum ColorEffectFilter {

    /**
     Modifies the pixel values in an image by applying a set of polynomial cross-products.
     
     Each component in an output pixel `out` is determined using the component values in the input
     pixel `in` according to a polynomial cross product with the input coefficients. That is, the
     red component of the output pixel is calculated using the `redCoefficients` parameter
     (abbreviated `rC` below) using the following formula:
     ````
     out.r =  in.r * rC[0] + in.g * rC[1] + in.b * rC[2]
     + in.r * in.r * rC[3] + in.g * in.g * rc[4] + in.b * in.b * rC[5]
     + in.r * in.g * rC[6] + in.g * in.b * rC[7] + in.b * in.r * rC[8]
     + rC[9]
     ````
     
     Then, the formula is repeated to calculate the blue and green components of the output pixel
     using the blue and green coefficients, respectively.
     
     This filter can be used for advancated color space and tone mapping conversions, such as
     imitating the color reproduction of vintage photography film.
     
     - Note: As with all color filters, this operation is performed in the working color space of
     the Core Image context executing the filter, using unpremultiplied pixel color values. If you
     see unexpected results, verify that your output and working color spaces are set up as
     intended.
     */
    case ColorCrossPolynomial(
        redCoefficients: [Float]?,
        greenCoefficients: [Float]?,
        blueCoefficients: [Float]?
    )

    /**
     Uses a three-dimensional color table to transform the source image pixels.
     
     This filter maps color values in the input image to new color values using a three-dimensional
     color lookup table (also called a CLUT or color cube). For each RGBA pixel in the input image,
     the filter uses the R, G, and B component values as indices to identify a location in 
     the table; the RGBA value at that location becomes the RGBA value of the output pixel.
     
     Use the `cubeData` parameter to provide data formatted for use as a color lookup table,
     and the `cubeDimension` parameter to specify the size of the table. This data should be an
     array of texel values in 32-bit floating-point RGBA linear premultiplied format. The
     `cubeDimension` parameter identifies the size of the cube by specifying the length of one
     side, so the size of the array should be `cubeDimension` cubed times the size of a single
     texel value. In the color table, the R component varies fastest, followed by G, then B. Listing
     1 shows a basic pattern for creating color cube data.
     
     Ex.: creating a Color Table:
     ````
     // Allocate and populate color cube table
     let size = 64
     var cubeData = [Float](repeating: 0, count: size * size * size * 4)
     var offset = 0
     for z in 0 ..< size {
         for y in 0 ..< size {
             for x in 0 ..< size {
                 cubeData[offset]   = <# output R value #>
                 cubeData[offset+1] = <# output G value #>
                 cubeData[offset+2] = <# output B value #>
                 cubeData[offset+3] = <# output A value #>
                 offset += 4
             }
         }
     }


     // Put the table in a data object and create the filter
     let data: Data = Data(bytes: cubeData, count: cubeData.count * MemoryLayout<Float>.size)

     let filter: ImageFilter = .ColorEffect(.ColorCube(cubeDimension: size,
                                                            cubeData: data))
     let image: UIImage = <# an image #>
     let filteredImage: UIImage = image.applyFilters(filter)
     ````
     (Highly recommend this [Stack Overflow answer](http://stackoverflow.com/a/32638622) for a more
     full and detailed explanation on constructing the color cube)

     For another example of this filter in action, see
     [Chroma Key Filter Recipe](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_filer_recipes/ci_filter_recipes.html#//apple_ref/doc/uid/TP30001185-CH4-SW2) in 
     [Core Image Programming Guide](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_intro/ci_intro.html#//apple_ref/doc/uid/TP30001185).
     
     - Note: As with color filters, this operation is performed in the working color space of the
     Core Image context executing the filter, using unpremultiplied pixel color values. If you see
     unexpected results, verify that your output and working color spaces are set up as intended.
     */
    case ColorCube(cubeDimension: Int?, cubeData: Data)

    /**
     Uses a three-dimensional color table to transform the source image pixels and maps the result
     to a specified color space.
     
     See `.ColorCube` for more details on the color cube operation. With the default color space
     (`null`), which is equivalent to `kCGColorSpaceGenericRGBLinear`, this filter's effect is
     identical to that of `.ColorCube`.
     */
    case ColorCubeWithColorSpace(
        cubeDimension: Int?,
        cubeData: Data,
        colorSpace: CGColorSpace?
    )

    /**
     Inverts the colors in an image.
     */
    case ColorInvert

    /**
     Performs a nonlinear transformation of source color values using mapping values provided in a 
     table.
     */
    case ColorMap(gradientImage: UIImage?)

    /**
     Remaps colors so they fall within shades of a single color.
     */
    case ColorMonochrome(color: UIColor?, intensity: Float?)

    /**
     Remaps red, green, and blue color components to the number of brightness values you specify for
     each color component.
     
     This filter flattens colors to achieve a look similar to that of a silk-screened poster.
     */
    case ColorPosterize(levels: Float?)

    /**
     Maps luminance to a color ramp of two colors.
     
     False color is often used to process astronomical and other scientific data, such as
     ultraviolet and x-ray images.
     */
    case FalseColor(color0: UIColor?, color1: UIColor?)

    /**
     Converts a grayscale image to a white image that is masked by alpha.
     
     The white values from the source image produce the inside of the mask; the black values become
     completely transparent.
     */
    case MaskToAlpha

    /**
     Returns a grayscale image from `max(r,g,b)`.
     */
    case MaximumComponent

    /**
     Returns a grayscale image from `min(r,g,b)`.
     */
    case MinimumComponent

    /**
     Applies a preconfigured set of effects that imitate vintage photography film with exaggerated
     color.
     */
    case PhotoEffectChrome

    /**
     Applies a preconfigured set of effects that imitate vintage photography film with diminished
     color.
     */
    case PhotoEffectFade

    /**
     Applies a preconfigured set of effects that imitate vintage photography film with distorted
     colors.
     */
    case PhotoEffectInstant

    /**
     Applies a preconfigured set of effects that imitate black-and-white photography film with low
     contrast.
     */
    case PhotoEffectMono

    /**
     Applies a preconfigured set of effects that imitate black-and-white photography film with
     exaggerated contrast.
     */
    case PhotoEffectNoir

    /**
     Applies a preconfigured set of effects that imitate vintage photography film with emphasized
     cool colors.
     */
    case PhotoEffectProcess

    /**
     Applies a preconfigured set of effects that imitate black-and-white photography film without
     significantly altering contrast.
     */
    case PhotoEffectTonal

    /**
     Applies a preconfigured set of effects that imitate vintage photography film with emphasized
     warm colors.
     */
    case PhotoEffectTransfer

    /**
     Maps the colors of an image to various shades of brown.
     */
    case SepiaTone(intensity: Float?)

    /**
     Reduces the brightness of an image at the periphery.
     */
    case Vignette(radius: Float?, intensity: Float?)

    /**
     Modifies the brightness of an image around the periphery of a specified region.
     */
    case VignetteEffect(center: CGPoint?, intensity: Float?, radius: Float?)
}

extension ColorEffectFilter: Subfilter {

    public var key: String {
        switch self {
        case .ColorCrossPolynomial: return "CIColorCrossPolynomial"
        case .ColorCube: return "CIColorCube"
        case .ColorCubeWithColorSpace: return "CIColorCubeWithColorSpace"
        case .ColorInvert: return "CIColorInvert"
        case .ColorMap: return "CIColorMap"
        case .ColorMonochrome: return "CIColorMonochrome"
        case .ColorPosterize: return "CIColorPosterize"
        case .FalseColor: return "CIFalseColor"
        case .MaskToAlpha: return "CIMaskToAlpha"
        case .MaximumComponent: return "CIMaximumComponent"
        case .MinimumComponent: return "CIMinimumComponent"
        case .PhotoEffectChrome: return "CIPhotoEffectChrome"
        case .PhotoEffectFade: return "CIPhotoEffectFade"
        case .PhotoEffectInstant: return "CIPhotoEffectInstant"
        case .PhotoEffectMono: return "CIPhotoEffectMono"
        case .PhotoEffectNoir: return "CIPhotoEffectNoir"
        case .PhotoEffectProcess: return "CIPhotoEffectProcess"
        case .PhotoEffectTonal: return "CIPhotoEffectTonal"
        case .PhotoEffectTransfer: return "CIPhotoEffectTransfer"
        case .SepiaTone: return "CISepiaTone"
        case .Vignette: return "CIVignette"
        case .VignetteEffect: return "CIVignetteEffect"
        }
    }

    public func setFilterOptions(filter: inout CIFilter) {

        switch self {

        case let .ColorCrossPolynomial(redCofficients, greenCoefficients, blueCoefficients):
            if (redCofficients?.count == 10) {
                filter.setOptions((redCofficients, .RedCoefficients))
            }

            if (greenCoefficients?.count == 10) {
                filter.setOptions((greenCoefficients, .GreenCoefficients))
            }

            if (blueCoefficients?.count == 10) {
                filter.setOptions((blueCoefficients, .BlueCoefficients))
            }

        case let .ColorCube(cubeDimension, cubeData):
            filter.setOptions((cubeDimension, .CubeDimension),
                              (cubeData, .CubeData))

        case let .ColorCubeWithColorSpace(cubeDimension, cubeData, colorSpace):
            filter.setOptions((cubeDimension, .CubeDimension),
                              (cubeData, .CubeData),
                              (colorSpace, .ColorSpace))

        case let .ColorMap(gradientImage):
            filter.setOptions((gradientImage, .GradientImage))

        case let .ColorMonochrome(color, intensity):
            filter.setOptions((color, .Color),
                              (intensity, .Intensity))

        case let .ColorPosterize(levels):
            filter.setOptions((levels, .Levels))

        case let .FalseColor(color0, color1):
            filter.setOptions((color0, .Color0),
                              (color1, .Color1))

        case let .SepiaTone(intensity):
            filter.setOptions((intensity, .Intensity))

        case let .Vignette(radius, intensity):
            filter.setOptions((radius, .Radius),
                              (intensity, .Intensity))

        case let .VignetteEffect(center, intensity, radius):
            filter.setOptions((center, .Center),
                              (intensity, .Intensity),
                              (radius, .Radius))

        default:
            break
        }

    }

}
