//
//  TileEffectFilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 2/7/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public enum TileEffectFilter {

    /**
     Performs an affine transform on a source image and then clamps the pixels at the edge of the 
     transformed image, extending them outwards.
     
     This filter performs similarly to the CIAffineTransform filter except that it produces an image
     with infinite extent. You can use this filter when you need to blur an image but you want to 
     avoid a soft, black fringe along the edges.
     */
    case AffineClamp(transform: CGAffineTransform)

    /**
     Applies an affine transform to an image and then tiles the transformed image.
     */
    case AffineTile(transform: CGAffineTransform)

    /**
     Produces a tiled image from a source image by applying an 8-way reflected symmetry.
     */
    case EightfoldReflectedTile(
        center: CGPoint?,
        angle: Float?,
        width: Float?
    )

    /**
     Produces a tiled image from a source image by applying a 4-way reflected symmetry.
     */
    case FourfoldReflectedTile(
        center: CGPoint?,
        angle: Float?,
        acuteAngle: Float?,
        width: Float?
    )

    /**
     Produces a tiled image from a source image by rotating the source image at increments of 90
     degrees.
     */
    case FourfoldRotatedTile(center: CGPoint?, angle: Float?, width: Float?)

    /**
     Produces a tiled image from a source image by applying 4 translation operations.
     */
    case FourfoldTranslatedTile(
        center: CGPoint?,
        angle: Float?,
        acuteAngle: Float?,
        width: Float?
    )

    /**
     Produces a tiled image from a source image by translating and smearing the image.
     */
    case GlideReflectedTile(center: CGPoint?, angle: Float?, width: Float?)

    /**
     Produces a kaleidoscopic image from a source image by applying 12-way symmetry.
     */
    case Kaleidoscope(count: Float?, center: CGPoint?, angle: Float?)

    /**
     Segments an image, applying any specified scaling and rotation, and then assembles the image
     again to give an op art appearance.
     */
    case OpTile(
        center: CGPoint?,
        scale: Float?,
        angle: Float?,
        width: Float?
    )

    /**
     Warps an image by reflecting it in a parallelogram, and then tiles the result
     */
    case ParallelogramTile(
        center: CGPoint?,
        angle: Float?,
        acuteAngle: Float?,
        width: Float?
    )

    /**
     Applies a perspective transform to an image and then tiles the reuslt.
     */
    case PerspectiveTile(
        topLeft: CGPoint?,
        topRight: CGPoint?,
        bottomRight: CGPoint?,
        bottomLeft: CGPoint?
    )

    /**
     Produces a tiled image from a source image by applying a 6-way reflected symmetry.
     */
    case SixfoldReflectedTile(center: CGPoint?, angle: Float?, width: Float?)

    /**
     Produces a tiled image from a source image by rotating the source image at increments of 60
     degrees.
     */
    case SixfoldRotatedTile(center: CGPoint?, angle: Float?, width: Float?)

    /**
     Maps a triangular portion of an input image to create a kaleidoscope effect.
     */
    case TriangleKaleidoscope(
        point: CGPoint?,
        size: Float?,
        rotation: Float?,
        decay: Float?
    )

    /**
     Maps a triangular portion of image to a triangular area and then tiles the result.
     */
    case TriangleTile(center: CGPoint?, angle: Float?, width: Float?)

    /**
     Produces a tiled image from a source image by rotating the source image at increments of 30
     degrees.
     */
    case TwelvefoldReflectedTile(
        center: CGPoint?,
        angle: Float?,
        width: Float?
    )

}

extension TileEffectFilter: Subfilter {

    internal var key: String {
        switch self {

        case .AffineClamp: return "CIAffineClamp"
        case .AffineTile: return "CIAffineTile"
        case .EightfoldReflectedTile: return "CIEightfoldReflectedTile"
        case .FourfoldReflectedTile: return "CIFourfoldReflectedTile"
        case .FourfoldRotatedTile: return "CIFourfoldRotatedTile"
        case .FourfoldTranslatedTile: return "CIFourfoldTranslatedTile"
        case .GlideReflectedTile: return "CIGlideReflectedTile"
        case .Kaleidoscope: return "CIKaleidoscope"
        case .OpTile: return "CIOpTile"
        case .ParallelogramTile: return "CIParallelogramTile"
        case .PerspectiveTile: return "CIPerspectiveTile"
        case .SixfoldReflectedTile: return "CISixfoldReflectedTile"
        case .SixfoldRotatedTile: return "CISixfoldRotatedTile"
        case .TriangleKaleidoscope: return "CITriangleKaleidoscope"
        case .TriangleTile: return "CITriangleTile"
        case .TwelvefoldReflectedTile: return "CITwelvefoldReflectedTile"

        }
    }

    internal func setFilterOptions(filter: inout CIFilter) {
        switch self {
        case let .AffineClamp(transform):
            filter.setOptions((transform, .Transform))

        case let .AffineTile(transform):
            filter.setOptions((transform, .Transform))

        case let .EightfoldReflectedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .FourfoldReflectedTile(center, angle, acuteAngle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (acuteAngle, .AcuteAngle),
                              (width, .Width))

        case let .FourfoldRotatedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .FourfoldTranslatedTile(center, angle, acuteAngle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (acuteAngle, .AcuteAngle),
                              (width, .Width))

        case let .GlideReflectedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .Kaleidoscope(count, center, angle):
            filter.setOptions((count, .Count),
                              (center, .Center),
                              (angle, .Angle))

        case let .OpTile(center, scale, angle, width):
            filter.setOptions((center, .Center),
                              (scale, .Scale),
                              (angle, .Angle),
                              (width, .Width))

        case let .ParallelogramTile(center, angle, acuteAngle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (acuteAngle, .AcuteAngle),
                              (width, .Width))

        case let .PerspectiveTile(topLeft, topRight, bottomRight, bottomLeft):
            filter.setOptions((topLeft, .TopLeft),
                              (topRight, .TopRight),
                              (bottomRight, .BottomRight),
                              (bottomLeft, .BottomLeft))

        case let .SixfoldReflectedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .SixfoldRotatedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .TriangleKaleidoscope(point, size, rotation, decay):
            filter.setOptions((point, .Point),
                              (size, .Size),
                              (rotation, .Rotation),
                              (decay, .Decay))

        case let .TriangleTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))

        case let .TwelvefoldReflectedTile(center, angle, width):
            filter.setOptions((center, .Center),
                              (angle, .Angle),
                              (width, .Width))
        }
    }
}

