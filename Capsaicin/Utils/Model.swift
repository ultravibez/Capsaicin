//
//  Model.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import Foundation

protocol Model: Codable {
    static var decoder: JSONDecoder { get }
}

extension Model {
    static var decoder: JSONDecoder {
        JSONDecoder()
    }
}
