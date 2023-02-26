//
//  WithdrawalOperationCell.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import UIKit

class WithdrawalOperationCell: UITableViewCell, BaseOperationCell {
    var operationId: Int?
    weak var delegate: OperationsCellDelegate?
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    static let reuseIdentifier = "WithdrawalOperationCell"
}
