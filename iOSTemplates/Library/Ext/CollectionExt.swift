//
//  CollectionExt.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 26/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension Array where Iterator.Element: Equatable {
    mutating func remove(item: Iterator.Element) {
        if let ind = firstIndex(of: item) {
            remove(at: ind)
        }
    }
}
