//
//  Subfilter.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

internal protocol Subfilter {
    var key: String { get }
    func setFilterOptions(filter: inout CIFilter)
}

internal extension Subfilter {

    func applyFilter(toImage image: CIImage) throws -> CIImage {
        guard var filter: CIFilter = CIFilter(name: self.key) else {
            throw SubfilterError.InvalidFilterKey(self.key)
        }

        filter.setDefaults()
        filter.setValue(image, forKey: kCIInputImageKey)
        self.setFilterOptions(filter: &filter)

        guard let output: CIImage = filter.value(forKey: kCIOutputImageKey) as? CIImage else {
            throw SubfilterError.InvalidOutput
        }

        return output
    }

}

internal enum SubfilterError: Error {
    case InvalidFilterKey(String)
    case InvalidOutput
}

extension SubfilterError: LocalizedError {

    internal var errorDescription: String? {
        switch self {
        case let .InvalidFilterKey(key):
            return NSLocalizedString("No existing filter matches key \(key)",
                comment: "Error: message to inform developer that a provided image filter key does not correspond to an existing filter")
        case .InvalidOutput:
            return NSLocalizedString("Failed to generate filtered image",
                                     comment: "Error: message to inform developer that the filtered image was unable to be produced")
        }
    }
}
