//
//  Client.swift
//  iOS-Boilerplate
//
//  Created by Daniel Vela Angulo on 03/12/2018.
//  Copyright © 2018 veladan. All rights reserved.
//

import Alamofire

extension Http {
class Client {
    private let manager: Alamofire.SessionManager
    private let baseURL = URL(string: Configuration.serverURL)!.appendingPathComponent(Configuration.basePath)  // swiftlint:disable:this line_length
    private let queue = DispatchQueue(label: "AlamofireLabel")

    init(accessToken: String) {
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        defaultHeaders["Authorization"] = "Bearer \(accessToken)"
        defaultHeaders["Accept"] = "application/json"
        defaultHeaders["secret"] = accessToken
        let configuration = URLSessionConfiguration.default
        // Add `Auth` header to the default HTTP headers set by `Alamofire`
        configuration.httpAdditionalHeaders = defaultHeaders
        self.manager = Alamofire.SessionManager(configuration: configuration)
//        self.manager.retrier = OAuth2Retrier()
    }

    func request<Response>(_ endpoint: Http.Endpoint<Response>,
                           completion: @escaping (Result<Response>) -> Void) {
        let url = self.url(path: endpoint.path)
        let request = self.manager.request(url,
                                           method: translate(method: endpoint.method),
                                           parameters: endpoint.parameters)
        print("Request: \(url) \(String(describing: endpoint.localizedDescription()))")
        request
            .validate()
            .responseData(queue: self.queue) { response in
                guard case let .failure(error) = response.result else {
                    // Decode with Endpoint extensions
                    let result = response.result.flatMap(endpoint.decode)
                    switch result {
                    case let .success(data):
                        completion(Result.success(data))
                    case let .failure(error):
                        completion(Result.error(-1, error.localizedDescription))
                    }
                    return
                }
                self.treat(error)
                completion(Result.error(response.response?.statusCode ?? 0, error.localizedDescription))
            }
    }

    private func translate(method: Method) -> HTTPMethod {
        switch method {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        case .put:
            return HTTPMethod.put
        case .patch:
            return HTTPMethod.patch
        case .delete:
            return HTTPMethod.delete
        }
    }

    private func treat(_ error: Any?) {
        if let error = error as? AFError {
            treat(afError: error)
        } else if let error = error as? URLError {
            print("URLError occurred: \(error)")
        } else {
            print("Unknown error: \(String(describing: error))")
        }
    }

    private func treat(afError error: AFError) {
        switch error {
        case .invalidURL(let url):
            print("Invalid URL: \(url) - \(error.localizedDescription)")
        case .parameterEncodingFailed(let reason):
            print("Parameter encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .multipartEncodingFailed(let reason):
            print("Multipart encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .responseValidationFailed(let reason):
            print("Response validation failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
            switch reason {
            case .dataFileNil, .dataFileReadFailed:
                print("Downloaded file could not be read")
            case .missingContentType(let acceptableContentTypes):
                print("Content Type Missing: \(acceptableContentTypes)")
            // swiftlint:disable:next pattern_matching_keywords
            case .unacceptableContentType(let acceptableTypes, let responseType):
                print("Response content type: \(responseType) was unacceptable: " + "\(acceptableTypes)")
            case .unacceptableStatusCode(let code):
                print("Response status code was unacceptable: \(code)")
            }
        case .responseSerializationFailed(let reason):
            print("Response serialization failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        }
        print("Underlying error: \(String(describing: error.underlyingError))")
    }

    private func url(path: Http.Path) -> URL {
        return baseURL.appendingPathComponent(path)
    }
}
}
