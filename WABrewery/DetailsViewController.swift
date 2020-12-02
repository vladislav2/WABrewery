//
//  DetailsViewController.swift
//  WABrewery
//
//  Created by user on 30.11.2020.
//  Copyright © 2020 Vlad Veretennikov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

  var brewery: Brewery! = nil
  
  var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      nameLabel.text = brewery.name
      nameLabel.textColor = .white
      view.addSubview(nameLabel)
      nameLabelConstraints()
    }
    
  
  func nameLabelConstraints() {
    nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
  }
  
}
