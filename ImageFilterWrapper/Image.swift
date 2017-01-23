//
//  Image.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/21/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public extension UIImage {

    public func apply(filters: Filter...) -> UIImage {
        guard var coreImage: CIImage = CIImage(image: self) else {
            return self
        }

        for filter in filters {
            do {
                try coreImage = filter.subfilter.applyTo(image: coreImage)
            } catch let error {
                print(error.localizedDescription)
            }
        }

        let context: CIContext = CIContext(options: nil)
        let rect: CGRect = coreImage.extent
        guard let cgImage: CGImage = context.createCGImage(coreImage, from: rect) else {
            return self
        }

        return UIImage(cgImage: cgImage)
    }

}
