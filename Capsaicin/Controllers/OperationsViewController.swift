//
//  OperationsViewController.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import UIKit

protocol OperationsCellDelegate: AnyObject {
    func infoButtonTapped(id: Int?)
}

final class OperationsViewController: UIViewController {
    
    let searchController = UISearchController()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let viewModel: OperationsViewModel
    let cellBuilder: CellBuilder
    
    init(viewModel: OperationsViewModel) {
        self.viewModel = viewModel
        self.cellBuilder = CellBuilder(tableView: self.tableView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupConstraints()
        initialSetup()
        viewModel.fetchOperations()
    }
    
    private func setupConstraints() {
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func initialSetup() {
        title = "Financial operations"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ChargeOperationCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ChargeOperationCell.reuseIdentifier)
        tableView.register(UINib(nibName: WithdrawalOperationCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: WithdrawalOperationCell.reuseIdentifier)
        tableView.register(UINib(nibName: DepositOperationCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: DepositOperationCell.reuseIdentifier)
    }
}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = cellBuilder
            .createCell(operation: viewModel.operations[indexPath.row])
        cell.delegate = self
        return cell as! UITableViewCell
    }
}

extension OperationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.operations[indexPath.row].operationType {
        case .cashWithdrawal:
            let vc = DetailsViewController(operationId: viewModel.operations[indexPath.row].operationId)
            navigationController?.pushViewController(vc, animated: true)
        default:
            print(viewModel.operations[indexPath.row].operationType)
        }
    }
}

extension OperationsViewController: OperationsCellDelegate {
    func infoButtonTapped(id: Int?) {
        guard let operationId = id else { return }
        let vc = DetailsViewController(operationId: operationId)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OperationsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let input = searchController.searchBar.text else { return }
        viewModel.filter(input: input)
        tableView.reloadData()
    }
    
}
