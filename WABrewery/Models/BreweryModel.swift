//
//  BreweryModel.swift
//  WABrewery
//
//  Created by user on 30.11.2020.
//  Copyright © 2020 Vlad Veretennikov. All rights reserved.
//

import Foundation

struct Brewery: Codable {
  let id: Int
  let name: String
  let breweryType: String
  let street: String
  //let address2: Bool?
  //let address3: Bool?
  let city: String
  let state: String
  //let countyProvince: Bool?
  let postalCode: String
  let country: String
  //let longitude: String
  //let latitude: String
  let phone: String
  let websiteUrl: String
  //let updatedAt: String
  //let createdAt: String
}
