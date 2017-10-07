//
//  TrendingCityCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TrendingCityCell: UITableViewCell {

    @IBOutlet weak var trendingCollectionview: UICollectionView!
    
    var trendingCityObj = TrendingCityTour()
    
    override func awakeFromNib() {
        
        let trendingCellNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        trendingCollectionview.register(trendingCellNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        trendingCollectionview.delegate = self
        trendingCollectionview.dataSource = self
        
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension TrendingCityCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        cell.hotelImagesLabel.image = UIImage(named: trendingCityObj.hotelImages[indexPath.row])
       cell.hotelTitleLabel.text = trendingCityObj.hotelNames[indexPath.row]
         cell.priceDiscountLabel.text = trendingCityObj.priceRanges[indexPath.row]
        cell.descriptionLabel.text = trendingCityObj.timeLeft[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width - 100)), height: CGFloat(280))
    }

}
