//
//  Image.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public extension UIImage {

    /**
     Applies a set of configured `ImageFilter` objects to an image.

     - Parameter filters: The set of image filters to apply to the image. Filters are applied
     in provided order.
     - Returns: A new UIImage object that is a copy of the original image with filters applied.
     */
    public func applyFilters(_ filters: ImageFilter...) -> UIImage {
        guard var coreImage: CIImage = CIImage(image: self) else {
            return self
        }

        let originalRect: CGRect = coreImage.extent

        for filter in filters {
            do {
                try coreImage = filter.subfilter.applyFilter(to: coreImage, requireInput: true)
            } catch let error {
                print(error.localizedDescription)
            }
        }

        let context: CIContext = CIContext(options: nil)
        let rect: CGRect = coreImage.extent

        if let cgImage: CGImage = context.createCGImage(coreImage, from: rect) {
            return UIImage(cgImage: cgImage)

        } else if let cgImage: CGImage = context.createCGImage(coreImage, from: originalRect) {
            return UIImage(cgImage: cgImage)
        }

        return self
    }

    public static func generate(_ producer: ImageProducer, size: CGSize) -> UIImage {
        var coreImage: CIImage = CIImage.empty()
        do {
            try coreImage = producer.subProducer.applyFilter(to: coreImage, requireInput: false)
        } catch let error {
            print(error.localizedDescription)
        }

        let context: CIContext = CIContext(options: nil)
        let rect: CGRect = CGRect(origin: .zero, size: size)

        if let cgImage: CGImage = context.createCGImage(coreImage, from: rect) {
            return UIImage(cgImage: cgImage)
        }

        return UIImage()
    }

}
