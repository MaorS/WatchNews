//
//  ArticleInterfaceController.swift
//  WatchTest
//
//  Created by Maor Shams on 09/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import UIKit
import WatchKit
import SDWebImage

class ArticleInterfaceController: WKInterfaceController {
    
    @IBOutlet var articleImage: WKInterfaceImage!
    @IBOutlet var articleDescription: WKInterfaceLabel!
    @IBOutlet var articleAuthor: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let article = context as? Article else{
            return
        }
        if let url = article.urlToImage{
            downloadImage(url: url)
        }
        articleDescription.setText(article.description)
        articleAuthor.setText(article.author)
    }
    
   
    
    func downloadImage(url : URL){
        articleImage.startActivityIndicator()
        
        SDWebImageDownloader.shared().downloadImage(with: url, options: SDWebImageDownloaderOptions.useNSURLCache, progress: nil) { (image, _, _, _) in
            
            self.articleImage.stopActivityIndicator()
            self.articleImage.setImage(image)
            
        }
        
    
    }
    
    
    
}
