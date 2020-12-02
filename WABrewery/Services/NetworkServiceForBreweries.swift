//
//  NetworkServiceForBreweries.swift
//  WABrewery
//
//  Created by user on 30.11.2020.
//  Copyright © 2020 Vlad Veretennikov. All rights reserved.
//

import Foundation

class NetworkServiceBreweries {
  
  static func getBreweries(completion: @escaping([Brewery]) -> ()) {
    let jsonUrlString = "https://api.openbrewerydb.org/breweries?by_state=Arizona"
    
    guard let url = URL(string: jsonUrlString) else { return }
    
    NetworkService.shared.getData(url: url) { (data) in
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let breweries = try decoder.decode([Brewery].self, from: data as! Data)
        completion(breweries)
      } catch let error {
        print("Error serialization json", error)
      }
    }
  }
}
