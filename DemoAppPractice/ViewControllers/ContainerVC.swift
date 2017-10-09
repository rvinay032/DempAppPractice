//
//  ContainerVC.swift
//  DemoAppPractice
//
//  Created by appinventiv on 09/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    // MARK:- Outlets........................
    
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK:- View Life cycle...........
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observer For toogle side menu......................
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toggleSideMenuShow"),
                                               object: nil, queue: OperationQueue.main,
                                               using: {(notification) in
                                                
                                                UIView.animate(withDuration:0.8, delay: 0.2,usingSpringWithDamping: 0.7,
                                                               initialSpringVelocity: 0.6,options: .curveEaseInOut,
                                                               animations:{
                                                                
                                                                self.sideView.transform = CGAffineTransform(translationX:225, y: 0.9)
                                                                self.containerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                                                                
                                                }){(true) in
                                                    
                                                }})
        
        // observer to hide side menu......................
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toggleSideMenuHide"),
                                               object: nil,
                                               queue: OperationQueue.main, using: {(notification) in
                                                
                                                UIView.animate(withDuration: 0.6, animations: {
                                                    
                                                    self.sideView.transform = CGAffineTransform(translationX:-225, y: 1)
                                                    self.containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                                    
                                                })})
        
    }
}
