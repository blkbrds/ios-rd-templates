//
//  OptionalExt.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 26/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation

extension Optional {

    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }

    func unwrapped(or error: Error) throws -> Wrapped {
        guard let this = self else { throw error }
        return this
    }
}
