//
//  CorporateServicesCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CorporateServicesCell: UITableViewCell {

   var corporateObj = CorporateServices()
    
    @IBOutlet weak var corporateServiceCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let nib = UINib(nibName: "HomeScreenCollectionViewCell", bundle: nil)
        corporateServiceCollectionView.register(nib, forCellWithReuseIdentifier: "HomeScreenCollectionViewCellId")
        
        corporateServiceCollectionView.delegate = self
        corporateServiceCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CorporateServicesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return corporateObj.corporateServiceName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenCollectionViewCellId", for: indexPath) as? HomeScreenCollectionViewCell else {fatalError("unable to make collection Cell") }
        
        cell.serviceImageLabel.font = UIFont.boldSystemFont(ofSize: 13)
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
