//
//  TopNearByEventsCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopNearByEventsCell: UITableViewCell {

    var topNearEventsObj = TopNearbyEvents()
    
    @IBOutlet weak var topNearByEvents: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let topNearByEventsNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        topNearByEvents.register(topNearByEventsNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        topNearByEvents.delegate = self
        topNearByEvents.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopNearByEventsCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return topNearEventsObj.eventTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        cell.hotelTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        cell.priceDiscountLabel.font = UIFont.boldSystemFont(ofSize: 12)
        cell.descriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        // cell.serviceImageLabel.numberOfLines = 1
        
        cell.hotelImagesLabel.image = UIImage(named: topNearEventsObj.eventImages[indexPath.row])
        cell.hotelTitleLabel.text = topNearEventsObj.eventTitles[indexPath.row]
        cell.priceDiscountLabel.text = topNearEventsObj.passes[indexPath.row]
        cell.descriptionLabel.text = topNearEventsObj.package[indexPath.row]
       
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 10), height: collectionView.frame.height - 190)
    }
    
    
    
}
