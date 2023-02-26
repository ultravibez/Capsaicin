//
//  DetailsViewController.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let operationId: Int
    
    init(operationId: Int) {
        self.operationId = operationId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        setupLabel()
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        titleLabel.text = "Operation id: \(operationId)"
    }
}
