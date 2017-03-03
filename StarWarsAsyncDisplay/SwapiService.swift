//
//  SwapiService.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/24/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

typealias JSONDictionary = Dictionary<String, Any>

final class SwapiService {
    
//    var searchTerm = "films"
    
    lazy var session: URLSession = URLSession.shared
    
    func fetchSwapiData(searchTerm: String, completion: @escaping (_ results: [JSONDictionary]?, _ error: Error?) -> ()) {
        
        let baseUrl: String = "http://swapi.co/api/"
        
        guard let url = URL(string: baseUrl + searchTerm + "/") else {
            fatalError("URL Error")
        }
        
//        print(url)
        
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async(execute: { 
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if let rootDictionary = json as? JSONDictionary {
                        let filmsArray = rootDictionary["results"] as? [JSONDictionary]
                        completion(filmsArray, nil)
                    }
                    
                } catch let underlyingError {
                    completion(nil, underlyingError)
                }
            })
        }.resume()
    }
}
