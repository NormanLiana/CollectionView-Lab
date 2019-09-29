//
//  CountryAPIClient.swift
//  Collection-View-Lab
//
//  Created by Liana Norman on 9/28/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class CountryAPIManager {
    private init() {}
    
    static let shared = CountryAPIManager()
    
    func getCountries(completionHandler: @escaping (Result<[Country], AppError>) -> () ) {
        let urlStr = "https://restcountries.eu/rest/v2/region/europe"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let countryInfo = try JSONDecoder().decode([Country].self, from: data)
                    
                    completionHandler(.success(countryInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
}
