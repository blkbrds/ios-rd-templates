//
//  BundleExt.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 26/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit

extension Bundle {

    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
