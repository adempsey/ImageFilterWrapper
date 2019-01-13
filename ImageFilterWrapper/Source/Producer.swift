//
//  Producer.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

public enum ImageProducer {

    case Gradient(GradientProducer)

    internal var subProducer: Subfilter {
        switch self {
        case let .Gradient(subfilter):
            return subfilter
        }
    }

}
