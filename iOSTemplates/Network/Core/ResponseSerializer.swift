//
//  ResponseSerializer.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 02/10/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Alamofire

final class CustomDecodableResponseSerializer<T: Decodable>: ResponseSerializer {

    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()

    private lazy var successSerializer = DecodableResponseSerializer<T>(decoder: decoder)
    private lazy var errorSerializer = DecodableResponseSerializer<APIError>(decoder: decoder)

    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> APIResponse<T> {

        guard Network.shared.isReachable else {
            return .failure(.noInternetConnection)
        }

        guard let response = response else {
            return .failure(APIError.emptyOrInvalidResponse)
        }

        let statusCode = response.statusCode

        if let error = error {
            // return .failure(error)
        }

        if 204...205 ~= statusCode { // empty data status code
            return .success(nil)
        }

        guard 200...299 ~= statusCode else {
            // Cancel request
            if statusCode == APIError.cancelRequest.statusCode {
                return .failure(.cancelRequest)
            }
            return .failure(.cancelRequest)
        }

        if let data = data {
            if let string = data.toString(), string.isNotEmpty {
                 let result = try successSerializer.serialize(request: request, response: response, data: data, error: nil)
                 // Success
                 return .success(result)
            } else {
                // Success but no response
                return .success(nil)
            }
        }

        // Failure
        return .failure(APIError.emptyOrInvalidResponse)
    }
}

extension DataRequest {

    @discardableResult
    func responseDecodable<T: Decodable>(queue: DispatchQueue = .global(qos: .background),
                                         for type: T.Type,
                                         completionHandler: @escaping APICompletion<T>) -> Self {
        return response(queue: .main,
                        responseSerializer: CustomDecodableResponseSerializer<T>()) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result)
            case .failure(let error):
                guard let errorCode = error.responseCode, let apiError = APIError(rawValue: errorCode) else {
                    completionHandler(.failure(APIError.unknown))
                    return
                }
                completionHandler(.failure(apiError))
            }
        }
    }
}
