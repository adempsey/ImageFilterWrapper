//
//  HalftoneEffectFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

public enum HalftoneEffectFilter {

    /**
     Simulates a circular-shaped halftone screen.
     */
    case CircularScreen(center: CGPoint?,
                        width: Float?,
                        sharpness: Float?)

    /**
     Creates a color, halftoned rendition of the source image, using cyan, magenta, yellow,
     and black inks over a white page.
     */
    case CMYKHalftone(center: CGPoint?,
                      width: Float?,
                      angle: Float?,
                      sharpness: Float?,
                      GCR: Float?,
                      UCR: Float?)

    /**
     Simulates the dot patterns of a halftone screen.
     */
    case DotScreen(center: CGPoint?,
                   angle: Float?,
                   width: Float?,
                   sharpness: Float?)

    /**
     Simulates the hatched pattern of a halftone screen.
     */
    case HatchedScreen(center: CGPoint?,
                       angle: Float?,
                       width: Float?,
                       sharpness: Float?)

    /**
     Simulates the line pattern of a halftone screen. 
     */
    case LineScreen(center: CGPoint?,
                    angle: Float,
                    width: Float?,
                    sharpness: Float?)

}

extension HalftoneEffectFilter: Subfilter {

    internal var key: String {
        switch self {
        case .CircularScreen: return "CICircularScreen"
        case .CMYKHalftone: return "CICMYKHalftone"
        case .DotScreen: return "CIDotScreen"
        case .HatchedScreen: return "CIHatchedScreen"
        case .LineScreen: return "CILineScreen"
        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .CircularScreen(center, width, sharpness):
            filter.setOptions((center, .Center),
                              (width, .Width),
                              (sharpness, .Sharpness))

        case let .CMYKHalftone(center, width, angle, sharpness, GCR, UCR):
            filter.setOptions((center, .Center),
                              (width, .Width),
                              (angle, .Angle),
                              (sharpness, .Sharpness),
                              (GCR, .GCR),
                              (UCR, .UCR))

        case let .DotScreen(center, angle, width, sharpness):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width),
                              (sharpness, .Sharpness))

        case let .HatchedScreen(center, angle, width, sharpness):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width),
                              (sharpness, .Sharpness))

        case let .LineScreen(center, angle, width, sharpness):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width),
                              (sharpness, .Sharpness))
        }
    }

}
