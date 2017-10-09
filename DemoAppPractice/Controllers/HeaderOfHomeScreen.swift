//
//  HeaderOfHomeScreen.swift
//  DemoAppPractice
//
//  Created by appinventiv on 06/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class HeaderOfHomeScreen: UITableViewHeaderFooterView {
    
    // MARK:- Side menu Actions......................
    
    @IBAction func sideMenuBtnTap(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenuShow"), object: nil, userInfo: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenuHide"), object: nil, userInfo: nil)
    }
    
}
