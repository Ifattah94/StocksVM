//
//  StocksTableViewController.swift
//  StocksVM
//
//  Created by C4Q on 1/24/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import UIKit

class StocksTableViewController: UITableViewController {

    
    var stockListVM: StockListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return stockListVM?.stocksViewModelByMonthDict.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stockListVM?.stockViemModels(at: section).count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath)
        let stocksInSection = stockListVM?.stockViemModels(at: indexPath.section)
        cell.textLabel?.text = stocksInSection?[indexPath.row].open.description
        cell.detailTextLabel?.text = stocksInSection?[indexPath.row].close.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "woo"
    }
    
    
    
    
    private func load() {
        JsonService().load(resource: Stock.all)  { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let stocks):
                    let stockViewModels = stocks.map{StockViewModel(stock: $0)}
                    self?.stockListVM = StockListViewModel(allStockVM: stockViewModels)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }



}
