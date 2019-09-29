//
//  ImageManager.swift
//  Collection-View-Lab
//
//  Created by Liana Norman on 9/28/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    // MARK: - Static Properties
    static let shared = ImageManager()
    
    // MARK: - Instance Methods
    func getImage(countryCode: String, completionHandler: @escaping (Result<UIImage, AppError>) -> ()) {
        let urlString = "https://www.countryflags.io/\(countryCode.lowercased())/shiny/64.png"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.badURL))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            
            completionHandler(.success(image))
            }.resume()
    }
    
    // MARK: - Private Properties and Initializers
    
    private init() {}
}
