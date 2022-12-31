//
//  Item.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 29/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation

final class Item {

    var id: Int
    var avatarURL: String?
    var titleLabel: String

    init(id: Int, avatarURL: String, titleLabel: String) {
        self.id = id
        self.avatarURL = avatarURL
        self.titleLabel = titleLabel
    }
}
