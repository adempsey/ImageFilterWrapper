//
//  Matrix.swift
//  ImageFilterWrapper
//
//  Created by Andrew Dempsey on 1/28/17.
//  Copyright © 2017 dempsey. All rights reserved.
//

public struct Matrix<Element> where Element: Numeric {

    private let rows: Int
    private let columns: Int
    internal var container: [Element]

    public init(rows: Int, columns: Int, defaultValue: Element) {
        self.rows = rows
        self.columns = columns
        self.container = [Element](repeatElement(defaultValue, count: rows * columns))
    }

    public init(_ values: [[Element]]) {
        self.rows = values.count
        self.columns = values[0].count
        self.container = Array(values.joined())
    }
    
}
