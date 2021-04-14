//
//  MarvelService.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//

import Alamofire

struct MarlaServiceError: Error {
    var id: Int
    var description: String
}

class MarvelService: NetworkingInjected {
    private var serverUrl = ""

    func listCharacters(_ onFinish: @escaping (Result<[MarvelDto]>) -> Void) {
        apiClient.request(API.list()) { result in
            switch result {
            case let .success(dto):
                onFinish(Result.success(dto))
            case let .error(id, description):
                onFinish(Result.failure(MarlaServiceError(id: id, description: description)))
            }
        }
    }

    func detail(of id: String, _ onFinish: @escaping (Result<MarvelDetailDto>) -> Void) {
        apiClient.request(API.detail(id)) { result in
            switch result {
            case let .success(dto):
                onFinish(Result.success(dto))
            case let .error(id, description):
                onFinish(Result.failure(MarlaServiceError(id: id, description: description)))
            }
        }
    }
}
