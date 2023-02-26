//
//  ChargeOperationCell.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import UIKit

class ChargeOperationCell: UITableViewCell, BaseOperationCell {
    var operationId: Int?
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var operationDescription: UILabel!
    static let reuseIdentifier = "ChargeOperationCell"
    weak var delegate: OperationsCellDelegate?
    
    @IBAction func infoTapped(_ sender: UIButton) {
        delegate?.infoButtonTapped(id: operationId)
    }
}
