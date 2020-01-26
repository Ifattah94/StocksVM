//
//  Stock.swift
//  StocksVM
//
//  Created by C4Q on 1/24/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation
struct Stock: Codable {
    var date: String
    var open: Double
    var close: Double
    
    
    static var all: Resource<[Stock]> {
        let fileName = "applestocks"
        let ext = "json"
        
        return Resource(fileName: fileName, extensionType: ext)
    }
    
    
    
}

