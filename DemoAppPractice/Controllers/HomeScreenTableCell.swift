//
//  HomeScreenTableCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class HomeScreenTableCell: UITableViewCell {

    
   var homeScreenObj = HomeScreen()
  
    @IBOutlet weak var dropButtonOut: UIButton!
    @IBOutlet weak var collectionViewHomeScreen: UICollectionView!
    
    @IBOutlet weak var leftView: UIView!
    
    @IBOutlet weak var rightView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "HomeScreenCollectionViewCell", bundle: nil)
        collectionViewHomeScreen.register(nib, forCellWithReuseIdentifier: "HomeScreenCollectionViewCellId")
      
        collectionViewHomeScreen.delegate = self
        collectionViewHomeScreen.dataSource = self
        
        shadowOfViews()
       
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeScreenTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeScreenObj.serviceNameArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenCollectionViewCellId", for: indexPath) as? HomeScreenCollectionViewCell else {fatalError("unable to make collection Cell")
        }
       
        cell.serviceImageLabel.text = homeScreenObj.serviceNameArr[indexPath.row]
        cell.serviceImageView.image = UIImage(named: homeScreenObj.serviceImagesArr[indexPath.row])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 4) - 10), height: CGFloat(120))
    }

}

extension HomeScreenTableCell {
    
    func shadowOfViews() {
        leftView.layer.borderWidth = 2.0
        leftView.layer.borderColor = UIColor.clear.cgColor
        leftView.layer.masksToBounds = true;
        
        leftView.layer.shadowColor = UIColor.gray.cgColor
        leftView.layer.shadowOffset = CGSize(width:0,height: 2.0)
        
        leftView.layer.shadowOpacity = 2.0
        leftView.layer.masksToBounds = false;
        
        rightView.layer.borderWidth = 2.0
        rightView.layer.borderColor = UIColor.clear.cgColor
        rightView.layer.masksToBounds = true;
        
        rightView.layer.shadowColor = UIColor.gray.cgColor
        rightView.layer.shadowOffset = CGSize(width:0,height: 2.0)
        
        rightView.layer.shadowOpacity = 2.0
        rightView.layer.masksToBounds = false;
        
    }
    
    
    
}
