//
//  StockViewModel.swift
//  StocksVM
//
//  Created by C4Q on 1/25/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

struct StockViewModel {
    let stock: Stock
    
    var open: Double {
        return stock.open
    }
    
    var close: Double {
        return stock.close
    }
    
    var stockDate: String {
        return stock.date
    }
    
    var month: Month {
        return Month(rawValue: monthComponent)!
    }
    
    
    var yearComponent: Int {
         let dateArray = stockDate.split(separator: "-")
         let year = dateArray[0]
        return Int(year)!
    }
    
    var monthComponent: Int {
        let dateArray = stockDate.split(separator: "-")
        let month = dateArray[1]
        return Int(month)!
    }
    
    var dayComponent: Int {
         let dateArray = stockDate.split(separator: "-")
         let day = dateArray[2]
        return Int(day)!
        
    }
    
    var actualDate: Date {
           let calender = Calendar.current
           let dateComponents = DateComponents(calendar: calender, timeZone: nil, era: nil, year: yearComponent, month: monthComponent, day: dayComponent, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
           return dateComponents.date!
       }
    
}
