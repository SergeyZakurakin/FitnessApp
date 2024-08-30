//
//  NetworkRequest.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/30/24.
//

import Foundation

class NetworkRequest {
    
    // singleTone for network request
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let apiKey = "5b3bb97e5140759a26defd7ebacaf558"
        let latitude = 48.1783
        let longitude = 23.2983
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                }
                
                guard let data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
