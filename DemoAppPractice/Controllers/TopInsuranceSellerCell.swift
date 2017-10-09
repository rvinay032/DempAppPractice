//
//  TopInsuranceSellerCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopInsuranceSellerCell: UITableViewCell {
    
    // MARK:- object for TopInsurance Model...................
    
    var insuranceOb = TopInsuranceSeller()
    
    // MARK:- Outlets.................
    
    @IBOutlet weak var insuranceCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let insuranceCellNib = UINib(nibName: "InsuranceCollectionCell", bundle: nil)
        insuranceCollectionView.register(insuranceCellNib, forCellWithReuseIdentifier: "InsuranceCollectionCellId")
        
        insuranceCollectionView.delegate = self
        insuranceCollectionView.dataSource = self
    }
    
}

// MARK:- Extension for Insurance cell..................

extension TopInsuranceSellerCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return insuranceOb.insuranceTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsuranceCollectionCellId", for: indexPath) as? InsuranceCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        cell.insuranceImage.image = UIImage(named: insuranceOb.insuranceImage[indexPath.row])
        cell.insuranceLabel.text = insuranceOb.insuranceTitle[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 10), height: collectionView.frame.height - 10)
        
    }
    
}
