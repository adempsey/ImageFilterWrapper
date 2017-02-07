//
//  StylizeFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/28/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum StylizeFilter {

    /**
     Uses alpha values from a mask to interpolate between an image and the background.
     
     When a mask alpha value is 0.0, the result is in the background. When the mask alpha value is
     1.0, the result is the image.
     */
    case BlendWithAlphaMask(backgroundImage: UIImage, maskImage: UIImage)

    /**
     Uses values from a grayscale mask to interpolate between an image and the background.
     
     When a mask value is 0.0, the result is the background. When the mask value is 1.0, the reuslt
     is the image.
     */
    case BlendWithMask(backgroundImage: UIImage, maskImage: UIImage)

    /**
     Softens edges and applies a pleasant glow to an image.
     */
    case Bloom(radius: Float?, intensity: Float?)

    /**
     Simulates a comic book drawing by outlining edges and applying a color halftone effect.
     */
    case ComicEffect

    /**
     A convolution filter generates each output pixel by summing all elements in the element-wise
     product of two matrices - a weight matrix and a matrix containing the neighborhood surrounding
     the corresponding input pixel - and adding a bias. This operation is performed independently
     for each color component (including the alpha component), and the resulting value is clamped to
     the range between `0.0` and `1.0`. You can create many types of image processing effects using
     different weight matrices, such as blurring, sharpening, edge detection, translation, and
     embossing.
     
     This filter uses a 3x3 weight matrix and the 3x3 neighborhood surrounding an input pixel (that 
     is, the pixel itself and those within a distance of one pixel horizontally or vertically).
     
     If you want to preserve the overall brightness of the image, ensure that the sum of all values
     in the weight matrix is `1.0`. You may find it convenient to devise a weight matrix without this
     constraint and then normalize it by dividing each element by the sum of all elements, as shown
     in the figure below.
     */
    case Convolution3X3(weights: Matrix<Int>?, bias: Float?)

    /**
     A convolution filter generates each output pixel by summing all elements in the element-wise
     product of two matrices - a weight matrix and a matrix containing the neighborhood surrounding
     the corresponding input pixel - and adding a bias. This operation is performed independently
     for each color component (including the alpha component), and the resulting value is clamped to
     the range between `0.0` and `1.0`. You can create many types of image processing effects using
     different weight matrices, such as blurring, sharpening, edge detection, translation, and
     embossing.

     This filter uses a 5x5 weight matrix and the 5x5 neighborhood surrounding an input pixel (that
     is, the pixel itself and those within a distance of one pixel horizontally or vertically).

     If you want to preserve the overall brightness of the image, ensure that the sum of all values
     in the weight matrix is `1.0`. You may find it convenient to devise a weight matrix without this
     constraint and then normalize it by dividing each element by the sum of all elements, as shown
     in the figure below.
     */
    case Convolution5X5(weights: Matrix<Int>?, bias: Float?)

    /**
     A convolution filter generates each output pixel by summing all elements in the element-wise
     product of two matrices - a weight matrix and a matrix containing the neighborhood surrounding
     the corresponding input pixel - and adding a bias. This operation is performed independently
     for each color component (including the alpha component), and the resulting value is clamped to
     the range between `0.0` and `1.0`. You can create many types of image processing effects using
     different weight matrices, such as blurring, sharpening, edge detection, translation, and
     embossing.

     This filter uses a 7x7 weight matrix and the 3x3 neighborhood surrounding an input pixel (that
     is, the pixel itself and those within a distance of one pixel horizontally or vertically).

     If you want to preserve the overall brightness of the image, ensure that the sum of all values
     in the weight matrix is `1.0`. You may find it convenient to devise a weight matrix without this
     constraint and then normalize it by dividing each element by the sum of all elements, as shown
     in the figure below.
     */
    case Convolution7X7(weights: Matrix<Int>?, bias: Float?)

    /**
     A convolution filter generates each output pixel by summing all elements in the element-wise
     product of two matrices - a weight matrix and a matrix containing the neighborhood surrounding
     the corresponding input pixel - and adding a bias. This operation is performed independently
     for each color component (including the alpha component), and the resulting value is clamped to
     the range between `0.0` and `1.0`. You can create many types of image processing effects using
     different weight matrices, such as blurring, sharpening, edge detection, translation, and
     embossing.

     This filter uses a 9x1 weight matrix and the 9x1 neighborhood surrounding an input pixel (that 
     is, the pixel itself and those within a distance of four pixels horizontally). Unlike 
     convolution filters which use square matrices, this filter can only produce effects along a
     horizontal axis, but it can be combined with Convolution9Vertical to approximate the effect
     of certain 9x9 weight matrices.

     If you want to preserve the overall brightness of the image, ensure that the sum of all values
     in the weight matrix is `1.0`. You may find it convenient to devise a weight matrix without 
     this constraint and then normalize it by dividing each element by the sum of all elements, as 
     shown in the figure below.
     */
    case Convolution9Horizontal(weights: [Int]?, bias: Float?)

    /**
     A convolution filter generates each output pixel by summing all elements in the element-wise
     product of two matrices - a weight matrix and a matrix containing the neighborhood surrounding
     the corresponding input pixel - and adding a bias. This operation is performed independently
     for each color component (including the alpha component), and the resulting value is clamped to
     the range between `0.0` and `1.0`. You can create many types of image processing effects using
     different weight matrices, such as blurring, sharpening, edge detection, translation, and
     embossing.

     This filter uses a 1x9 weight matrix and the 1x9 neighborhood surrounding an input pixel (that
     is, the pixel itself and those within a distance of four pixels horizontally). Unlike
     convolution filters which use square matrices, this filter can only produce effects along a
     horizontal axis, but it can be combined with Convolution9Horizontal to approximate the effect
     of certain 9x9 weight matrices.

     If you want to preserve the overall brightness of the image, ensure that the sum of all values
     in the weight matrix is `1.0`. You may find it convenient to devise a weight matrix without
     this constraint and then normalize it by dividing each element by the sum of all elements, as
     shown in the figure below.
     */
    case Convolution9Vertical(weights: [Int]?, bias: Float?)

    /**
     Creates polygon-shaped color blocks by aggregating source pixel-color values.
     */
    case Crystallize(radius: Float?, center: Float?)

    /**
     Simulates a depth of field effect.
     - `point0`: The focused region of the image stretches in a line between `point0` and `point1`
     of the image.
     - `point1`: The end of the line stretching between `point0` and `point1`
     - `saturation:` Indicates the amount to adjust the saturation on the in-focus portion of the 
     image.
     - `unsharpMaskRadius`: Specifies the radius of the unsharp mask effect applied to the in-focus
     area.
     - `unsharpMaskIntensity`: Specifies the intensity of the unsharp mask effect applied to the
     in-focus area.
     - `radius`: Controls how much the out-of-focus regions are blurred. Specifies the distance from
     the center of the effect.
     */
    case DepthOfField(
        point0: CGPoint,
        point1: CGPoint,
        saturation: Float,
        unsharpMaskRadius: Float,
        unsharpMaskIntensity: Float,
        radius: Float
    )

    /**
     Finds all edges in an image and displays them in color.
     */
    case Edges(intensity: Float?)

    /**
     Produces a stylized black-and-white rendition of an image that looks similar to a woodblock
     cutout.
     */
    case EdgeWork(radius: Float?)

    /**
     Dulls the highlights of an image.
     */
    case Gloom(radius: Float?, intensity: Float?)

    /**
     Produces a continuous three-dimensional, loft-shaped height field from a grayscale mask.
     
     The white values of the mask define those pixels that are inside the height field while the
     black values define those pixels that are outside. The field varies smoothly and continuously
     inside the mask, reaching the value 0 at the edge of the mask. You can use this filter with the
     `ShadedMaterial` filter to produce extremely realistic shaded objects.
     */
    case HeightFieldFromMask(radius: Float?)

    /**
     Maps an image to colored hexagons whose color is defined by the replaced pixels.
     */
    case HexagonalPixellate(center: CGPoint?, scale: Float?)

    /**
     Adjusts the tonal mapping of an image while preserving spatial detail.
     */
    case HighlightShadowAdjust(
        highlightAmount: Float?,
        shadowAmount: Float?
    )

    /**
     Creates a sketch that outlines the edges of an image in  black.
     
     The portions of the image that are not outlined are transparent.
     */
    case LineOverlay(
        NRNoiseLevel: Float?,
        NRSharpness: Float?,
        edgeIntensity: Float?,
        threshold: Float?,
        contrast: Float?
    )

    /**
     Makes an image blocky by mapping the image to colored squares whose color is defined by the
     replaced pixels.
     */
    case Pixellate(center: CGPoint?, scale: Float?)

    /**
     Renders the source image in a pointillistic style.
     */
    case Pointillize(radius: Float?, center: CGPoint?)

    /**
     Produces a shaded image from a height field.
     
     The height field is defined to have greater heights with lighter shades, and lesser heights
     (lower areas) with darker shades. You can combine this filter with the `HeightFieldFromMask`
     filter to produce quick shadings of masks, such as text.
     
     This filter sets the input image as a height-field (multiplied by the scale parameter) and
     computes a normal vector for each pixel. It then uses that normal vector to look up the
     reflected color for that direction in the input shading image.
     
     The input shading image contains the picture of a hemisphere, which defines the way the surface
     is shaded. The look-up coordinate for a normal vector is:
     ````
     (normal.xy + 1.0) * 0.5 * vec2(shadingImageWidth, shadingImageHeight)
     ````
     */
    case ShadedMaterial(shadingImage: UIImage, scale: Float?)

    /**
     Replaces one or more color ranges with spot colors.
     */
    case SpotColor(
        centerColor1: UIColor,
        replacementColor1: UIColor,
        closeness1: Float?,
        contrast1: Float?,
        centerColor2: UIColor?,
        replacementColor2: UIColor?,
        closeness2: Float?,
        contrast2: Float?,
        centerColor3: UIColor?,
        replacementColor3: UIColor?,
        closeness3: Float?,
        contrast3: Float?
    )

    /**
     Applies a directional spotlight to an image.
     */
    case SpotLight(
        lightPosition: (x: Float, y: Float, z: Float)?,
        lightPointsAt: (x: Float, y: Float, z: Float)?,
        brightness: Float?,
        concentration: Float?,
        color: UIColor
    )
}

extension StylizeFilter: Subfilter {

    internal var key: String {
        switch self {
        case .BlendWithAlphaMask: return "CIBlendWithAlphaMask"
        case .BlendWithMask: return "CIBlendWithMask"
        case .Bloom: return "CIBloom"
        case .ComicEffect: return "CIComicEffect"
        case .Convolution3X3: return "CIConvolution3X3"
        case .Convolution5X5: return "CIConvolution5X5"
        case .Convolution7X7: return "CIConvolution7X7"
        case .Convolution9Horizontal: return "CIConvolution9Horizontal"
        case .Convolution9Vertical: return "CIConvolution9Vertical"
        case .Crystallize: return "CICrystallize"
        case .DepthOfField: return "CIDepthOfField"
        case .Edges: return "CIEdges"
        case .EdgeWork: return "CIEdgeWork"
        case .Gloom: return "CIGloom"
        case .HeightFieldFromMask: return "CIHeightFieldFromMask"
        case .HexagonalPixellate: return "CIHexagonalPixellate"
        case .HighlightShadowAdjust: return "CIHighlightShadowAdjust"
        case .LineOverlay: return "CILineOverlay"
        case .Pixellate: return "CIPixellate"
        case .Pointillize: return "CIPointillize"
        case .ShadedMaterial: return "CIShadedMaterial"
        case .SpotColor: return "CISpotColor"
        case .SpotLight: return "CISpotLight"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .BlendWithAlphaMask(backgroundImage, maskImage):
            filter.setOptions((backgroundImage, .BackgroundImage),
                              (maskImage, .MaskImage))

        case let .BlendWithMask(backgroundImage, maskImage):
            filter.setOptions((backgroundImage, .BackgroundImage),
                              (maskImage, .MaskImage))

        case let .Bloom(radius, intensity):
            filter.setOptions((radius, .Radius),
                              (intensity, .Intensity))

        case let .Convolution3X3(weights, bias):
            filter.setOptions((weights, .Weights),
                              (bias, .Bias))

        case let .Crystallize(radius, center):
            filter.setOptions((radius, .Radius),
                              (center, .Center))

        case let .DepthOfField(point0, point1, saturation, unsharpMaskRadius, unsharpMaskIntensity, radius):
            filter.setOptions((point0, .Point0),
                              (point1, .Point1),
                              (saturation, .Saturation),
                              (unsharpMaskRadius, .UnsharpMaskRadius),
                              (unsharpMaskIntensity, .UnsharpMaskIntensity),
                              (radius, .Radius))

        case let .Edges(intensity):
            filter.setOptions((intensity, .Intensity))

        case let .EdgeWork(radius):
            filter.setOptions((radius, .Radius))

        case let .Gloom(radius, intensity):
            filter.setOptions((radius, .Radius),
                              (intensity, .Intensity))

        case let .HeightFieldFromMask(radius):
            filter.setOptions((radius, .Radius))

        case let .HexagonalPixellate(center, scale):
            filter.setOptions((center, .Center),
                              (scale, .Scale))

        case let .HighlightShadowAdjust(highlightAmount, shadowAmount):
            filter.setOptions((highlightAmount, .HighlightAmount),
                              (shadowAmount, .ShadowAmount))

        case let .LineOverlay(NRNoiseLevel, NRSharpness, edgeIntensity, threshold, contrast):
            filter.setOptions((NRNoiseLevel, .NRNoiseLevel),
                              (NRSharpness, .NRSharpness),
                              (edgeIntensity, .EdgeIntensity),
                              (threshold, .Threshold),
                              (contrast, .Contrast))

        case let .Pixellate(center, scale):
            filter.setOptions((center, .Center),
                              (scale, .Scale))

        case let .Pointillize(radius, center):
            filter.setOptions((radius, .Radius),
                              (center, .Center))

        case let .ShadedMaterial(shadingImage, scale):
            filter.setOptions((shadingImage, .ShadingImage),
                              (scale, .Scale))

        case let .SpotColor(
            centerColor1,
            replacementColor1,
            closeness1,
            contrast1,
            centerColor2,
            replacementColor2,
            closeness2,
            contrast2,
            centerColor3,
            replacementColor3,
            closeness3,
            contrast3):

            filter.setOptions((centerColor1, .CenterColor1),
                              (replacementColor1, .ReplacementColor1),
                              (closeness1, .Closeness1),
                              (contrast1, .Contrast1),
                              (centerColor2, .CenterColor2),
                              (replacementColor2, .ReplacementColor2),
                              (closeness2, .Closeness2),
                              (contrast2, .Contrast2),
                              (centerColor2, .CenterColor2),
                              (replacementColor2, .ReplacementColor2),
                              (closeness2, .Closeness2),
                              (contrast2, .Contrast2),
                              (centerColor3, .CenterColor3),
                              (replacementColor3, .ReplacementColor3),
                              (closeness3, .Closeness3),
                              (contrast3, .Contrast3))

        case let .SpotLight(lightPosition, lightPointsAt, brightness, concentration, color):
            filter.setOptions((lightPosition, .LightPosition),
                              (lightPointsAt, .LightPointsAt),
                              (brightness, .Brightness),
                              (concentration, .Concentration),
                              (color, .Color))
            
        default:
            break
        }
    }
}
