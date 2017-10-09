//
//  ViewController.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets...................
    
    @IBOutlet weak var homeScreenTableView: UITableView!
    var buttonTap = false
    
    // MARK:- View Life Cycle...............
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.registernib()
        
        homeScreenTableView.delegate = self
        homeScreenTableView.dataSource = self
        
    }
    
}

// MARK:- Extenson for ViewController....................

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableCellId", for: indexPath) as? HomeScreenTableCell
                else {fatalError("unable to make cell")}
            
            cell.dropButtonOut.addTarget(self, action: #selector(downButton), for: UIControlEvents.touchUpInside)
            
            return cell
        }
            
        else if indexPath.row == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CorporateServicesCellId", for: indexPath) as? CorporateServicesCell
                else {fatalError("unable to make cell")}
            
            return cell
        }
            
        else if indexPath.row == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCityCellId", for: indexPath) as? TrendingCityCell
                else {fatalError("unable to make cell")}
            
            return cell
        }
            
        else if indexPath.row == 3 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopRatedRestaurantCellId", for: indexPath) as? TopRatedRestaurantCell
                else {fatalError("unable to make cell")}
            
            return cell
        }
            
        else if indexPath.row == 4 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopNearByEventsCellId", for: indexPath) as? TopNearByEventsCell
                else {fatalError("unable to make cell")}
            
            return cell
        }
            
        else if indexPath.row == 5{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopInsuranceSellerCellId", for: indexPath) as? TopInsuranceSellerCell
                else {fatalError("unable to make cell")}
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            if buttonTap{
                
                return 300
            }
            else {
                
                return 180
            }
            
        }
            
        else if indexPath.row == 1 {
            
            return 200
        }
            
        else if indexPath.row == 2 {
            
            return 350
        }
            
        else if indexPath.row == 3 {
            
            return 270
        }
            
        else if indexPath.row == 4 {
            
            return 600
        }
            
        else if indexPath.row == 5{
            
            return 200
        }
        
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderOfHomeScreenId") as? HeaderOfHomeScreen else{fatalError("unable to make Header")}
        
      
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 150
    }
    
}

extension ViewController {
    
    func registernib() {
        
        let homeScreenCellNib = UINib(nibName: "HomeScreenTableCell", bundle: nil)
        homeScreenTableView.register(homeScreenCellNib, forCellReuseIdentifier: "HomeScreenTableCellId")
        
        let homeScreenHeaderNib = UINib(nibName: "HeaderOfHomeScreen", bundle: nil)
        homeScreenTableView.register(homeScreenHeaderNib, forHeaderFooterViewReuseIdentifier: "HeaderOfHomeScreenId")
        
        
        let corporateServicesCellNib = UINib(nibName: "CorporateServicesCell", bundle: nil)
        homeScreenTableView.register(corporateServicesCellNib, forCellReuseIdentifier: "CorporateServicesCellId")
        
        
        let trendingCityCellNib = UINib(nibName: "TrendingCityCell", bundle: nil)
        homeScreenTableView.register(trendingCityCellNib, forCellReuseIdentifier: "TrendingCityCellId")
        
        let topRatedRestaurantCell = UINib(nibName: "TopRatedRestaurantCell", bundle: nil)
        homeScreenTableView.register(topRatedRestaurantCell, forCellReuseIdentifier: "TopRatedRestaurantCellId")
        
        let topNearByEventsCell = UINib(nibName: "TopNearByEventsCell", bundle: nil)
        homeScreenTableView.register(topNearByEventsCell, forCellReuseIdentifier: "TopNearByEventsCellId")
        
        let topInsuranceSellerCell = UINib(nibName: "TopInsuranceSellerCell", bundle: nil)
        homeScreenTableView.register(topInsuranceSellerCell, forCellReuseIdentifier: "TopInsuranceSellerCellId")
        
    }
    @objc func downButton(){
        
        buttonTap = !buttonTap
        
        let index = IndexPath.init(row: 0, section: 0)
        
        let cell = self.homeScreenTableView.cellForRow(at: index) as? HomeScreenTableCell
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            if cell?.transform == .identity{
                
                self.homeScreenTableView.reloadRows(at:[index], with:.automatic)
//                cell?.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }
            
        }, completion: { (true) in
            
//            cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        })
        
    }
    
}
