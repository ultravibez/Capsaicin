//
//  CellBuilder.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import UIKit

class CellBuilder {
    
    weak var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func createCell(operation: Operation) -> BaseOperationCell {
        switch operation.operationType {
        case .charge:
            return createBaseCell(operation)
        case .cashWithdrawal:
            return createWithdrawalCell(operation)
        case .refund, .salary, .savingsWithdrawal:
            return createDepositCell(operation)
        }
    }
}

private extension CellBuilder {
    func createBaseCell(_ operation: Operation) -> BaseOperationCell {
        let cell = tableView?.dequeueReusableCell(withIdentifier: ChargeOperationCell.reuseIdentifier) as! ChargeOperationCell
        let description = operation
            .operationDesc
            .flatMap { $0 }
        cell.amountLabel.text = "$\(operation.amount)"
        cell.operationDescription.text = description
        cell.operationId = operation.operationId
        cell.selectionStyle = .none
        return cell
    }
    
    func createWithdrawalCell(_ operation: Operation) -> BaseOperationCell {
        let cell = tableView?.dequeueReusableCell(withIdentifier: WithdrawalOperationCell.reuseIdentifier) as! WithdrawalOperationCell
        cell.amountLabel.text = "$\(operation.amount)"
        cell.sourceLabel.text = operation.source
        cell.addressLabel.text = operation.address
        cell.operationId = operation.operationId
        return cell
    }
    
    func createDepositCell(_ operation: Operation) -> BaseOperationCell {
        let cell = tableView?.dequeueReusableCell(withIdentifier: DepositOperationCell.reuseIdentifier) as! DepositOperationCell
        let description = operation
            .operationDesc
            .flatMap { $0 }
        cell.amountLabel.text = "$\(operation.amount)"
        cell.operationDescription.text = description
        cell.operationId = operation.operationId
        cell.selectionStyle = .none
        return cell
    }
}
