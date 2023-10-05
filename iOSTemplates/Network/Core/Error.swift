//
//  ErrorConfiguration.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 02/10/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Alamofire

typealias Network = NetworkReachabilityManager

// MARK: - Network
extension Network {

    static let shared: Network = {
        guard let manager = Network() else {
            fatalError("")
        }
        return manager
    }()
}

enum APIError: Int, Error, Decodable {

    case emptyOrInvalidResponse = 400
    case cancelRequest = 888
    case authenticationFailed = 401
    case noInternetConnection
    case requestTimeout = -1_001
    case forceUpdate = 426
    case unknown = 999

    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return ""
        case .authenticationFailed:
            return ""
        case .requestTimeout:
            return ""
        case .forceUpdate:
            return ""
        default:
            return ""
        }
    }

    var statusCode: Int {
        switch self {
        case .noInternetConnection:
            return 599
        case .authenticationFailed:
            return 401
        case .requestTimeout:
            return -1_001
        case .forceUpdate:
            return 426
        default:
            return 400
        }
    }
}
