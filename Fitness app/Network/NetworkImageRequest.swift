//
//  NetworkImageRequest.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/30/24.
//

import Foundation

class NetworkImageRequest {
    
    // singleTone for network Image request
    static let shared = NetworkImageRequest()
    private init() {}
    
    func requestData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {

        let urlString = "https://openweathermap.org/img/wn/\(id)@2x.png"
        
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


