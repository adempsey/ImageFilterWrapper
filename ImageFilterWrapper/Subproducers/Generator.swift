//
//  Generator.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/14/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

public enum PDF417BarcodeCompactionMode: Int {
    case Automatic = 1
    case Numeric = 2
    case Text = 3
    case Byte = 4
}

public enum QRCodeCorrectionLevelFormat: String {
    case L = "L"
    case M = "M"
    case Q = "Q"
    case H = "H"
}

public enum GeneratorProducer {

    /**
     Generates an output image representing the input data according to the ISO/IEC 24778:2008
     standard. The width and height of each module (square dot) of the code in the output image
     is one pixel. The output image also includes two pixels of padding on each side
     (for example, a 15 x 15 code creates a 19 x 19 image).
     */
    case AztecCode(message: String,
                   correctionLevel: Float?,
                   layers: Int?,
                   compactStyle: Bool?)

    /**
     Generates a checkerboard pattern. You can specify the checkerboard size and colors, and
     the sharpness of the pattern.
     */
    case Checkerboard(center: CGPoint?,
                      color0: UIColor,
                      color1: UIColor,
                      width: Float?,
                      sharpness: Float?)

    /**
     Generates a Code 128 one-dimensional barcode from input data. Generates an output image
     representing the input data according to the ISO/IEC 15417:2007 standard. The width of each
     module (vertical line) of the barcode in the output image is one pixel. The height of the
     barcode is 32 pixels.
     */
    case Code128Barcode(message: String,
                        quietSpace: Int?)

    /**
     Generates a solid color.
     */
    case ConstantColor(color: UIColor)

    /**
     Simulates a lens flare. This filter is typically applied to another image to simulate lens
     floares and similar effects.
     */
    case LenticularHalo(center: CGPoint?,
                        color: UIColor,
                        haloRadius: Float?,
                        haloWidth: Float?,
                        haloOverlap: Float?,
                        striationStrength: Float?,
                        striationContrast: Float?,
                        time: Float?)

    /**
     Generates a PDF417 code (two-dimensional barcode) from input data. Generates an output image
     representing the input data according to the ISO 15438 standard. PDF417 codes are commonly
     used in postage, package tracking, personal identification documents, and coffeeshop
     membership cards. The width and height of each module (square dot) of the code in the output
     image is one point.
     */
    case PDF417Barcode(message: String,
                       minWidth: Int?,
                       maxWidth: Int?,
                       minHeight: Int?,
                       maxHeight: Int?,
                       dataColumns: Int?,
                       rows: Int?,
                       preferredAspectRatio: Float?,
                       compactionMode: PDF417BarcodeCompactionMode?,
                       compactStyle: Bool?,
                       correctionLevel: Int?,
                       alwaysSpecifyCompaction: Bool?)

    /**
     Generates a Quick Response code (two-dimensional barcode) from input data.  Generates an
     output image representing the input data according to the ISO/IEC 18004:2006 standard.
     The width and height of each module (square dot) of the code in the output image is one point.

     The inputCorrectionLevel parameter controls the amount of additional data encoded in the
     output image to provide error correction. Higher levels of error correction result in larger
     output images but allow larger areas of the code to be damaged or obscured without.
     There are four possible correction modes (with corresponding error resilience levels):

     * L: 7%
     * M: 15%
     * Q: 25%
     * H: 30%
     */
    case QRCode(message: String,
                correctionLevel: QRCodeCorrectionLevelFormat?)

    /**
     Generates an image of infinite extent whose pixel values are made up of four independent,
     uniformly-distributed random numbers in the 0 to 1 range.
     */
    case Random

    /**
     Generates a starburst pattern that is similar to a supernova; can be used to simulate a
     lens flare. The output image is typically used as input to another filter.
     */
    case StarShine(center: CGPoint?,
                   color: UIColor,
                   radius: Float?,
                   crossScale: Float?,
                   crossAngle: Float?,
                   crossOpacity: Float?,
                   crossWidth: Float?,
                   epsilon: Float?)

    /**
     Generates a stripe pattern. You can control the color of the stripes, the spacing, and the
     contrast.
     */
    case Stripes(center: CGPoint?,
                 color0: UIColor,
                 color1: UIColor,
                 width: Float?,
                 sharpness: Float?)

    /**
     Generates a sun effect. You typically use the output of the sunbeams filter as input to a
     composite filter.
    */
    case Sunbeams(center: CGPoint?,
                  color: UIColor,
                  sunRadius: Float?,
                  maxStriationRadius: Float?,
                  striationStrength: Float?,
                  striationContrast: Float?,
                  time: Float?)
}

extension GeneratorProducer: Subfilter {

    internal var key: String {
        switch self {
        case .AztecCode: return "CIAztecCodeGenerator"
        case .Checkerboard: return "CICheckerboardGenerator"
        case .Code128Barcode: return "CICode128BarcodeGenerator"
        case .ConstantColor: return "CIConstantColorGenerator"
        case .LenticularHalo: return "CILenticularHaloGenerator"
        case .PDF417Barcode: return "CIPDF417BarcodeGenerator"
        case .QRCode: return "CIQRCodeGenerator"
        case .Random: return "CIRandomGenerator"
        case .StarShine: return "CIStarShineGenerator"
        case .Stripes: return "CIStripesGenerator"
        case .Sunbeams: return "CISunbeamsGenerator"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .AztecCode(message, correctionLevel, layers, compactStyle):
            let encodedMessage = message.data(using: .isoLatin1)
            filter.setOptions((encodedMessage, .Message),
                              (correctionLevel, .CorrectionLevel),
                              (layers, .Layers),
                              (compactStyle, .CompactStyle))

        case let .Checkerboard(center, color0, color1, width, sharpness):
            filter.setOptions((center, .Center),
                              (color0, .Color0),
                              (color1, .Color1),
                              (width, .Width),
                              (sharpness, .Sharpness))

        case let .Code128Barcode(message, quietSpace):
            let encodedMessage = message.data(using: .ascii)
            filter.setOptions((encodedMessage, .Message),
                              (quietSpace, .QuietSpace))

        case let .ConstantColor(color):
            filter.setOptions((color, .Color))

        case let .LenticularHalo(center,
                                 color,
                                 haloRadius,
                                 haloWidth,
                                 haloOverlap,
                                 striationStrength,
                                 striationContrast,
                                 time):
            filter.setOptions((center, .Center),
                              (color, .Color),
                              (haloRadius, .HaloRadius),
                              (haloWidth, .HaloWidth),
                              (haloOverlap, .HaloOverlap),
                              (striationStrength, .StriationStrength),
                              (striationContrast, .StriationContrast),
                              (time, .Time))

        case let .PDF417Barcode(message,
                                minWidth,
                                maxWidth,
                                minHeight,
                                maxHeight,
                                dataColumns,
                                rows,
                                preferredAspectRatio,
                                compactionMode,
                                compactStyle,
                                correctionLevel,
                                alwaysSpecifyCompaction):
            let encodedMessage = message.data(using: .isoLatin1)
            filter.setOptions((encodedMessage, .Message),
                              (minWidth, .MinWidth),
                              (maxWidth, .MaxWidth),
                              (minHeight, .MinHeight),
                              (maxHeight, .MaxHeight),
                              (dataColumns, .DataColumns),
                              (rows, .Rows),
                              (preferredAspectRatio, .PreferredAspectRatio),
                              (compactionMode?.rawValue, .CompactionMode),
                              (compactStyle, .CompactStyle),
                              (correctionLevel, .CorrectionLevel),
                              (alwaysSpecifyCompaction, .AlwaysSpecifyCompaction))

        case let .QRCode(message, correctionLevel):
            let encodedMessage = message.data(using: .isoLatin1)
            filter.setOptions((encodedMessage, .Message),
                              (correctionLevel?.rawValue, .CorrectionLevel))

        case let .StarShine(center,
                            color,
                            radius,
                            crossScale,
                            crossAngle,
                            crossOpacity,
                            crossWidth,
                            epsilon):
            filter.setOptions((center, .Center),
                              (color, .Color),
                              (radius, .Radius),
                              (crossScale, .CrossScale),
                              (crossAngle, .CrossAngle),
                              (crossOpacity, .CrossOpacity),
                              (crossWidth, .CrossWidth),
                              (epsilon, .Epsilon))

        case let .Stripes(center, color0, color1, width, sharpness):
            filter.setOptions((center, .Center),
                              (color0, .Color0),
                              (color1, .Color1),
                              (width, .Width),
                              (sharpness, .Sharpness))

        case let .Sunbeams(center,
                           color,
                           sunRadius,
                           maxStriationRadius,
                           striationStrength,
                           striationContrast,
                           time):
            filter.setOptions((center, .Center),
                              (color, .Color),
                              (sunRadius, .SunRadius),
                              (maxStriationRadius, .MaxStriationRadius),
                              (striationStrength, .StriationStrength),
                              (striationContrast, .StriationContrast),
                              (time, .Time))

        default:
            break
        }

    }

}
