//
//  BaseOperationCell.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import Foundation

protocol BaseOperationCell {
    var delegate: OperationsCellDelegate? { get set }
    var operationId: Int? { get set }
}
