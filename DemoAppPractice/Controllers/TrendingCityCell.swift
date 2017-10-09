//
//  TrendingCityCell.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TrendingCityCell: UITableViewCell {
    
    // MARK:- Variable declaration..........
    
    private var currentIndex:Int = 0
    
    // MARK:- Object.........
    
    var trendingCityObj = TrendingCityTour()
    
    // MARK:- Outlets........................
    
    @IBOutlet weak var trendingCollectionview: UICollectionView!
    
    @IBOutlet weak var trendingCityPageController: UIPageControl!
    
    @IBOutlet weak var backView: UIView!
    
    
    // MARK:- Actions for pagecontroller....................
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let trendingCellNib = UINib(nibName: "TrendingcityCollectionCell", bundle: nil)
        trendingCollectionview.register(trendingCellNib, forCellWithReuseIdentifier: "TrendingcityCollectionCellId")
        
        trendingCollectionview.delegate = self
        trendingCollectionview.dataSource = self
        
        trendingCityPageController.hidesForSinglePage = true
        
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

// MARK:- Extension for Trending City cell................

extension TrendingCityCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIPageViewControllerDelegate, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trendingCityObj.hotelNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingcityCollectionCellId", for: indexPath) as? TrendingcityCollectionCell else {fatalError("unable to make collection Cell")
        }
        
        self.trendingCityPageController.numberOfPages = trendingCityObj.hotelNames.count
        
        cell.hotelImagesLabel.image = UIImage(named: trendingCityObj.hotelImages[indexPath.row])
        cell.hotelTitleLabel.text = trendingCityObj.hotelNames[indexPath.row]
        cell.priceDiscountLabel.text = trendingCityObj.priceRanges[indexPath.row]
        cell.descriptionLabel.text = trendingCityObj.timeLeft[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width - 100)), height: CGFloat(280))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let pageWidth = scrollView.frame.width
        
        self.currentIndex = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        self.trendingCityPageController.currentPage =
            self.currentIndex
    }
    
}
