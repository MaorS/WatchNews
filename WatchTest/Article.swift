//
//  Article.swift
//  WatchTest
//
//  Created by Maor Shams on 08/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import UIKit

class Article{
    
    let publishedAt : Date
    let author : String
    let title : String
    let description : String
    let url : URL?
    let urlToImage : URL?
    
    init(publishedAt : String,
         author : String,
         title : String,
         description : String,
         url : String,
         urlToImage : String) {
        self.publishedAt = Article.dateFrom(publishedAt)
        self.author = author
        self.title = title
        self.description = description
        self.url = URL(string: url)
        self.urlToImage = URL(string: urlToImage)
        
}
    
    
    class func dateFrom(_ strDate : String)->Date{
        let dateformatter = DateFormatter()
        dateformatter.timeZone = .current
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateformatter.date(from: strDate)!
    }
    

    
}
