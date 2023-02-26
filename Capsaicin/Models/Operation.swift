//
//  Operation.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import Foundation

enum OperationType: String, Codable {
    case cashWithdrawal = "CASH_WITHDRAWAL"
    case savingsWithdrawal = "SAVING_WITHDRAWAL"
    case charge = "CHARGE"
    case refund = "REFUND"
    case salary = "SALARY"
}

struct Operation: Model {
    let operationType: OperationType
    let amount: Double
    let source: String?
    let operationDesc: String?
    let address: String?
    let operationId: Int
}
