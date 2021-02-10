//
//  GifHTTPCalls.swift
//  SampleGiphyApp
//
//  Created by Sravya Kaki on 11/27/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation
class GifHTTPCalls {
    let apiKey = "KsCLnHxclXzhmo2Yzva8VWCHWpLZJNHj"
    /**
     Fetches gifs from the Giphy api
    -Parameter searchTerm: What we should query gifs of.
    */
   func fetchGifs(searchTerm: String, completion: @escaping (_ response: GifArray?) -> Void) {
        // Create a GET url request
        let url = urlBuilder(searchTerm: searchTerm)
       var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print("Error fetching from Giphy: ", err.localizedDescription)
            }
            do {
                // Decode the data into array of Gifs
                DispatchQueue.main.async {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
        }.resume()
    }
    
    func displayTrendingGifs(completion: @escaping(_ response: GifArray?) -> Void) {
        let url = urlBuilderTrendingGifs()
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let err = error {
            print("Error fetching from Giphy: ", err.localizedDescription)
        }
     
        do {
            DispatchQueue.main.async {
                let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                completion(object)
            }
            }
        }.resume()
        
    }
    func urlBuilder(searchTerm: String) -> URL {
        let apikey = apiKey
        var components = URLComponents()
           components.scheme = "https"
           components.host = "api.giphy.com"
           components.path = "/v1/gifs/search"
           components.queryItems = [
               URLQueryItem(name: "api_key", value: apikey),
               URLQueryItem(name: "q", value: searchTerm),
               URLQueryItem(name: "limit", value: "20") // Edit limit to display more gifs
           ]
        return components.url!
    }
    
    func urlBuilderTrendingGifs() -> URL {
        let apikey = apiKey
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/trending"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apikey),
            URLQueryItem(name: "limit", value: "20")
        ]
        return components.url!
    }
}
