//
//  NetworkDataFetch.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/30/24.
//

import Foundation

class NetworkDataFetch {
    
        // singleTone for network request
        static let shared = NetworkDataFetch()
        private init() {}
        
        func fetchWeather(response: @escaping (WeatherModel?, Error?) -> Void) {
            
            NetworkRequest.shared.requestData { result in
                switch result {
                case .success(let data):
                    
                    do {
                        let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                        response(weather, nil)
                        
                        // error decoder
                    } catch let jsonError {
                        print("Fail decode Json", jsonError)
                    }
                    
                    
                    
                    // error data!
                case .failure(let error):
                    print(error.localizedDescription)
                    response(nil, error)
                }
            }
            
        }
    }
