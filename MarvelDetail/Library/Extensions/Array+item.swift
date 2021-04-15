//
//  Array+item.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 15/4/21.
//

import Foundation

extension Array {
    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
