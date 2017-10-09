//
//  TopRatedRestaurantCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopRatedRestaurantCell: UITableViewCell {
    
    // MARK:- Object for RestaurantModel................
    
    var toRatedRestaurants = TopRatedRestaurant()
    
    // MARK:- Outlets...........
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var topRatedRestaurant: UICollectionView!
    
    // MARK:- Register nib and set delegate and datasource................
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let topRatedRestaurantsNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        topRatedRestaurant.register(topRatedRestaurantsNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        topRatedRestaurant.delegate = self
        topRatedRestaurant.dataSource = self
        
        self.backView.layer.borderWidth = 1
        self.backView.layer.cornerRadius = 5
        backView.layer.borderColor = UIColor.clear.cgColor
        
        self.backView.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4.0
        backView.layer.shadowColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        
    }
    
}

// MARK:- Extension for Restaurant cell..................

extension TopRatedRestaurantCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return toRatedRestaurants.restaurantsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        cell.hotelTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        cell.priceDiscountLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        cell.descriptionLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)

        cell.hotelImagesLabel.image = UIImage(named: toRatedRestaurants.restaurantsImages[indexPath.row])
        cell.hotelTitleLabel.text = toRatedRestaurants.restaurantsNames[indexPath.row]
        cell.priceDiscountLabel.text = toRatedRestaurants.offers[indexPath.row]
        cell.descriptionLabel.text = toRatedRestaurants.foodPack[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 18), height: collectionView.frame.height - 25)
    }
    
}
