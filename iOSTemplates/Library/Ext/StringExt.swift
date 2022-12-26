//
//  StringExt.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 26/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

extension Optional where Wrapped == String {
    var content: String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }

    var isBlankOrNil: Bool {
        return self == nil || self?.trimmed == ""
    }
}

extension String {

    enum Process {
        case encode
        case decode
    }

    // MARK: Trimmed

    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func trimmedTextByLimit(limit: Int) -> String {
        if isEmpty || count <= limit {
            return self
        } else {
            return String(prefix(limit))
        }
    }

    // The offset into a string's UTF-16 encoding for endIndex of self
    var endEncodedOffset: Int {
        return endIndex.utf16Offset(in: self)
    }

    func base64(_ method: Process) -> String? {
        switch method {
        case .encode:
            return data(using: .utf8)?.base64EncodedString()
        case .decode:
            guard let data = Data(base64Encoded: self) else { return nil }
            return String(data: data, encoding: .utf8)
        }
    }

    // MARK: String size

    func contentHeight(contentWidth: CGFloat, attributes: [NSAttributedString.Key: Any]) -> CGFloat {
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        let constraintRect = CGSize(width: contentWidth, height: .greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return boundingBox.height
    }

    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width
    }

    func getSubstring(from: Int?, with length: Int) -> String {
        guard let start = from, start >= 0, start < count, length >= start else {
            return ""
        }

        let end: Int
        if start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        guard end >= start else { return "" }
        let startIndex = index(self.startIndex, offsetBy: start)
        let endIndex = index(self.startIndex, offsetBy: end)
        return String(self[startIndex...endIndex])
    }

    func checkSubstringEqual(fromIndex index: Int, withLength length: Int, equalTo str: String) -> Bool {
        let subStr = getSubstring(from: index, with: length)
        guard subStr.isNotEmpty else { return false }
        return subStr == str
    }
}
