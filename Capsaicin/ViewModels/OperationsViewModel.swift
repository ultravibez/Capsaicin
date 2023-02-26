//
//  OperationsViewModel.swift
//  Capsaicin
//
//  Created by Matan Dahan on 23/02/2023.
//

import Foundation

class OperationsViewModel {
    var operations: [Operation] = []
    var allOperations: [Operation] = []
    
    func fetchOperations() {
        if let url = Bundle.main.url(forResource: "operations", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result = try JSONDecoder().decode(Results<Operation>.self, from: data)
                operations = result.operations
                allOperations = result.operations
            } catch {
                print("Parsing failed: \(error)")
            }
        }
    }
    
    func filter(input: String) {
        if input.isEmpty {
            operations = allOperations
            return
        }
        let filteredOperations = allOperations
            .filter { operation in
                return operation.operationDesc?.compactMap{$0}.contains(input) ?? false ||
                operation.source?.compactMap{$0}.contains(input) ?? false ||
                operation.address?.compactMap{$0}.contains(input) ?? false ||
                operation.amount.description.contains(input)
            }
        operations = filteredOperations
    }
}
