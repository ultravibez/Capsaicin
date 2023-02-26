//
//  Results.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import Foundation

struct Results<Item: Model>: Model {
    let operations: [Item]
}

extension Results {
    static var decoder: JSONDecoder {
        Item.decoder
    }
}
