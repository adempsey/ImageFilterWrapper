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
     */
    case Blur(BlurFilter)

    /**
     A filter that sharpens images, increasing the contrast between the edges in an image.
     */
    case Sharpen(SharpenFilter)

    /**
     A filter that changes color values. Color adjustment filters are used to eliminate color casts,
     adjust hue, and correct brightness and contrast. Color adjustment filters do not perform color
     management; ColorSync performs color management. You can use Quartz 2D to specify the color space
     associated with an image. For more information, see
     [Color Management Overview](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/csintro/csintro_intro/csintro_intro.html#//apple_ref/doc/uid/TP30001148)
     and [Quartz 2D Programming Guide](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066).
     */
    case ColorAdjustment(ColorAdjustmentFilter)

    internal var subfilter: Subfilter {
        switch self {
        case let .Blur(subfilter):
            return subfilter
        case let .Sharpen(subfilter):
            return subfilter
        case let .ColorAdjustment(subfilter):
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
