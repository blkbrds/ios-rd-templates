//
//  TargetType.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 29/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Alamofire

protocol TargetType {

    var baseURL: String { get }

    var version: String { get }

    var path: String? { get }

    var method: HTTPMethod { get }

    var parameters: Parameters? { get }

    var headers: HTTPHeaders? { get }
}

extension TargetType {

    var headers: HTTPHeaders? {
        return nil
    }
}
