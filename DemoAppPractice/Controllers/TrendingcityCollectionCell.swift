//
//  TrendingcityCollectionCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 07/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TrendingcityCollectionCell: UICollectionViewCell {
    
    // MARK:- Outlets...................
    
    @IBOutlet weak var hotelImagesLabel: UIImageView!
    
    @IBOutlet weak var hotelTitleLabel: UILabel!
    
    @IBOutlet weak var priceDiscountLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.hotelImagesLabel.layer.cornerRadius = 4
          self.hotelImagesLabel.layer.masksToBounds = true
        
        self.hotelImagesLabel.layer.shadowOpacity = 1
        self.hotelImagesLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.hotelImagesLabel.layer.shadowRadius = 2.5
        hotelImagesLabel.layer.shadowColor = UIColor.black.cgColor
        
        self.layer.masksToBounds = false

    }
    
}
