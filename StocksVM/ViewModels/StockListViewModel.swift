//
//  StockListViewModel.swift
//  StocksVM
//
//  Created by C4Q on 1/25/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

class StockListViewModel {
    var stocksViewModelByMonthDict: [Month: [StockViewModel]]
    
    
    func stockViemModels(at index: Int) -> [StockViewModel] {
        if let stockVMs = self.stocksViewModelByMonthDict[Month(rawValue: index + 1)!]?.sorted(by: {$0.actualDate < $1.actualDate}) {
            return stockVMs
        }
        return []
    }
    init (allStockVM: [StockViewModel]) {
       
        
        let groupedItems = Dictionary(grouping: allStockVM, by: {$0.month})
        
        self.stocksViewModelByMonthDict = groupedItems
    }
}
