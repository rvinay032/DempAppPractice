//
//  CorporateServicesCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CorporateServicesCell: UITableViewCell {
    
    // MARK:- Object of CorporateSevices model Class............
    
    var corporateObj = CorporateServices()
    // MARK:- Outlets........................
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var corporateServiceCollectionView: UICollectionView!
    
    // MARK:- register nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "HomeScreenCollectionViewCell", bundle: nil)
        corporateServiceCollectionView.register(nib, forCellWithReuseIdentifier: "HomeScreenCollectionViewCellId")
        
        corporateServiceCollectionView.delegate = self
        corporateServiceCollectionView.dataSource = self
        
        self.backView.layer.borderWidth = 1
        self.backView.layer.cornerRadius = 5
        backView.layer.borderColor = UIColor.clear.cgColor
        
        self.backView.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 3.5
        backView.layer.shadowColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
    }
    
}

// MARK:- Extension for CorporateServiceCell....................

extension CorporateServicesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return corporateObj.corporateServiceName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenCollectionViewCellId", for: indexPath) as? HomeScreenCollectionViewCell else {fatalError("unable to make collection Cell") }
        
        cell.serviceImageLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        cell.serviceImageLabel.textColor = UIColor.black
        cell.serviceImageLabel.numberOfLines = 1
        
        cell.serviceImageLabel.text = corporateObj.corporateServiceName[indexPath.row]
        cell.serviceImageView.image = UIImage(named: corporateObj.corporateServiceImage[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 5), height: CGFloat(120))
    }
}
