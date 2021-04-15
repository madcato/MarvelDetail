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

    func listCharacters(_ onFinish: @escaping (Result<[Marvel.CharacterDto]>) -> Void) {
        apiClient.request(MarvelAPI.characters()) { result in
            switch result {
            case let .success(response):
                guard let array = response.data?.results else {
                    onFinish(Result.failure(MarlaServiceError(id: 0,
                                                              description:
                    "Invalid response from Marvel API: list characters")))
                    return
                }
                onFinish(Result.success(array))
            case let .error(id, description):
                onFinish(Result.failure(MarlaServiceError(id: id, description: description)))
            }
        }
    }

    func characterDetail(of id: Int, _ onFinish: @escaping (Result<Marvel.CharacterDto>) -> Void) {
        apiClient.request(MarvelAPI.character(id)) { result in
            switch result {
            case let .success(response):
                guard let dto = response.data?.results?[0] else {
                    onFinish(Result.failure(MarlaServiceError(id: 0,
                                                              description:
                    "Invalid response from Marvel API: character datail")))
                    return
                }
                onFinish(Result.success(dto))
            case let .error(id, description):
                onFinish(Result.failure(MarlaServiceError(id: id, description: description)))
            }
        }
    }

}
