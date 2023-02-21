//
//  Extensions.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 21.02.2023.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
