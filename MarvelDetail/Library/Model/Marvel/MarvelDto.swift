//
//  MarvelDto.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//

import Foundation

enum Marvel {

// MARK: - MarvelDto main response

struct ResponseDto: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    var data: DataDto?
}

// MARK: - Marvel Data

struct DataDto: Decodable {
    let offset, limit, total, count: Int?
    var results: [CharacterDto]?
}

// MARK: - Marvel Character

struct CharacterDto: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: ImageDto?
}
}
