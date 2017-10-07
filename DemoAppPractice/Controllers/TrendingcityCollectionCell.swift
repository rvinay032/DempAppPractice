//
//  TrendingcityCollectionCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 07/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TrendingcityCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var hotelImagesLabel: UIImageView!
    
    @IBOutlet weak var hotelTitleLabel: UILabel!
    
    @IBOutlet weak var priceDiscountLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
