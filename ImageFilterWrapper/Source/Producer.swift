//
//  Producer.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/13/19.
//  Copyright © 2019 dempsey. All rights reserved.
//

public enum ImageProducer {

    /**
     A filter that generates a fill whose color varies smoothly. Exactly how color varies
     depends on the type of gradient - linear, radial, or Gaussian.

     Possible producers are:
     ````
     case Gaussian
     case Linear
     case Radial
     case SmoothLinear
     ````
     */
    case Gradient(GradientProducer)

    internal var subProducer: Subfilter {
        switch self {
        case let .Gradient(subfilter):
            return subfilter
        }
    }

}
