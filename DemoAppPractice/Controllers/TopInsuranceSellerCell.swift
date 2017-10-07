//
//  TopInsuranceSellerCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TopInsuranceSellerCell: UITableViewCell {

    
    var insuranceOb = TopInsuranceSeller()
    
    @IBOutlet weak var insuranceCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    let insuranceCellNib = UINib(nibName: "InsuranceCollectionCell", bundle: nil)
        insuranceCollectionView.register(insuranceCellNib, forCellWithReuseIdentifier: "InsuranceCollectionCellId")
        
        insuranceCollectionView.delegate = self
        insuranceCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TopInsuranceSellerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return insuranceOb.insuranceTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsuranceCollectionCellId", for: indexPath) as? InsuranceCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        return cell
    }
    
    
    
    
}
