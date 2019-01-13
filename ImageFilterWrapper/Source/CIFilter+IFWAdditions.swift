//
//  Configurable.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

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
