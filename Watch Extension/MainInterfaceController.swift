//
//  MainInterfaceController.swift
//  WatchTest
//
//  Created by Maor Shams on 09/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import UIKit
import WatchKit
import SDWebImage

class MainInterfaceController: WKInterfaceController {
    
    @IBOutlet var titleLabel: WKInterfaceLabel!
    
    @IBOutlet var activityIndicationImage: WKInterfaceImage!
    @IBOutlet var fetchButton: WKInterfaceButton!
    
    static let welcomeMSG = "Welcome"
    static let fetchingMSG = "Fetching News..."

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    @IBAction func fetchAction() {
        
        activityIndicationImage.startActivityIndicator()
        fetchButton.setAlpha(0)
        titleLabel.setText(MainInterfaceController.fetchingMSG)
        
        NewsManager.manager.getNews { [weak self] articles in
            self?.titleLabel.setText(MainInterfaceController.welcomeMSG)
            self?.fetchButton.setAlpha(1)
            self?.activityIndicationImage.stopActivityIndicator()
            self?.pushController(withName: "newsIC", context: articles)
        }
    }
    
    
    
    
    
}
