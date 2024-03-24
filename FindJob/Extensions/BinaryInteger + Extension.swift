//
//  BinaryInteger.swift
//  FindJob
//
//  Created by Denis on 3/21/24.
//

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
