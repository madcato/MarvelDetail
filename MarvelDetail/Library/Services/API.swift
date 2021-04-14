//
//  API.swift
//  iOS-Boilerplate
//
//  Created by Daniel Vela Angulo on 03/12/2018.
//  Copyright © 2018 veladan. All rights reserved.
//

// SAMPLE CODE

enum API {
    static func list() -> Http.Endpoint<[MarvelDto]> {
        return Http.Endpoint(
            method: .get,
            path: "/isbn/"
        )
    }

    static func detail(_ id: String) -> Http.Endpoint<MarvelDetailDto> {
        return Http.Endpoint(
            method: .get,
            path: "/isbn/\(id)"
        )
    }
}
