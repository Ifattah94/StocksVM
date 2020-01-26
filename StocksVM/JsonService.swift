//
//  JsonService.swift
//  StocksVM
//
//  Created by C4Q on 1/25/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

struct Resource<T: Codable> {
    let fileName: String?
    let extensionType: String?
    
    
}

enum AppError: Error {
    case NOFile
    case badJSON
    case noData
    
}

class JsonService {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, AppError>) -> Void) {
        
        guard let filePath = Bundle.main.path(forResource: resource.fileName, ofType: resource.extensionType) else {
            completion(.failure(.NOFile))
            return
        }
        
         let url = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.noData))
        }
        
    }
}
