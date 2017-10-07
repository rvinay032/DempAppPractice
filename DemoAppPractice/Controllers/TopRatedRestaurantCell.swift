//
//  TopRatedRestaurantCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopRatedRestaurantCell: UITableViewCell {

    
    var toRatedRestaurants = TopRatedRestaurant()
    
    @IBOutlet weak var topRatedRestaurant: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let topRatedRestaurantsNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        topRatedRestaurant.register(topRatedRestaurantsNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        topRatedRestaurant.delegate = self
        topRatedRestaurant.dataSource = self
        
        // Initialization code
    }
  
}

extension TopRatedRestaurantCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toRatedRestaurants.restaurantsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        cell.hotelTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
         cell.priceDiscountLabel.font = UIFont.boldSystemFont(ofSize: 12)
         cell.descriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
       // cell.serviceImageLabel.numberOfLines = 1
        
        cell.hotelImagesLabel.image = UIImage(named: toRatedRestaurants.restaurantsImages[indexPath.row])
        cell.hotelTitleLabel.text = toRatedRestaurants.restaurantsNames[indexPath.row]
        cell.priceDiscountLabel.text = toRatedRestaurants.offers[indexPath.row]
        cell.descriptionLabel.text = toRatedRestaurants.foodPack[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3)), height: collectionView.frame.height - 10)
    }
    
    
    
}
