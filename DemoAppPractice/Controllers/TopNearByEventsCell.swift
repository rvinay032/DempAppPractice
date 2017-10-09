//
//  TopNearByEventsCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopNearByEventsCell: UITableViewCell {
    
    // MARK:- Object for NearByEvent model..........
    
    var topNearEventsObj = TopNearbyEvents()
    
    // MARK:- Outlet...............
    
    @IBOutlet weak var backVIew: UIView!
    
    @IBOutlet weak var topNearByEvents: UICollectionView!
    
    // MARK:- register nib and set delegtate and dataSource...........
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let topNearByEventsNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        topNearByEvents.register(topNearByEventsNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        topNearByEvents.delegate = self
        topNearByEvents.dataSource = self
        
        self.backVIew.layer.borderWidth = 1
        self.backVIew.layer.cornerRadius = 5
        backVIew.layer.borderColor = UIColor.clear.cgColor
        
        self.backVIew.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 3.5
        backVIew.layer.shadowColor = UIColor.gray.cgColor
        
        self.layer.masksToBounds = false
        
    }
}

// MARK:- Extension for NearByEvents cell..................

extension TopNearByEventsCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return topNearEventsObj.eventTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        
        cell.hotelTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cell.priceDiscountLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        cell.descriptionLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)

        cell.hotelImagesLabel.image = UIImage(named: topNearEventsObj.eventImages[indexPath.row])
        cell.hotelTitleLabel.text = topNearEventsObj.eventTitles[indexPath.row]
        cell.priceDiscountLabel.text = topNearEventsObj.passes[indexPath.row]
        cell.descriptionLabel.text = topNearEventsObj.package[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 7), height: collectionView.frame.height - 250)
    }
    
}
