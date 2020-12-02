//
//  ViewController.swift
//  WABrewery
//
//  Created by user on 30.11.2020.
//  Copyright © 2020 Vlad Veretennikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  var breweryTableView = UITableView()
  let idTableViewCell = "breweryCell"
  var breweriesArray = [Brewery]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "Breweries"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    self.breweryTableView = UITableView(frame: view.bounds, style: .plain)
    self.breweryTableView.register(UITableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    self.breweryTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    self.breweryTableView.delegate = self
    self.breweryTableView.dataSource = self
    
    view.addSubview(breweryTableView)
    
    getBreweries()
    
  }

  func getBreweries() {
    NetworkServiceBreweries.getBreweries { [weak self] (breweries) in
      self?.breweriesArray = breweries
      self?.breweryTableView.beginUpdates()
      var i = 0
      
      for _ in self!.breweriesArray {
        self?.breweryTableView.insertRows(at: [IndexPath(row: i, section: 0)], with: .none)
        i = i + 1
      }
      self?.breweryTableView.endUpdates()
      //self?.breweryTableView.reloadData()
    }
  }

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return breweriesArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = breweryTableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath)
    cell.textLabel?.text = breweriesArray[indexPath.row].name
    print(indexPath)
    return cell
  }
  
  
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailsViewController()
    detailVC.brewery = breweriesArray[indexPath.row]
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
 
}

