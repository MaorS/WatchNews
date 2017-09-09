//
//  NewsManager.swift
//  WatchTest
//
//  Created by Maor Shams on 08/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import UIKit
import Alamofire


class NewsManager : NSObject{
    
    static let manager = NewsManager()
    override init(){}
    
    static let apiKey = "55fa996df13a401b8865489d54294162"
    let baseURL = URL(string: "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=\(apiKey)")!
    
    func getNews(completion : @escaping ( [Article])->Void ){
        
        Alamofire.request(baseURL, method: .get, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            guard let dictionary = try? response.result.unwrap() as? NSDictionary,
                let articles = dictionary?["articles"] as? NSArray else{
                    completion([])
                    return
            }
            
            var articlesObjects = [Article]()
            
            for article in articles{
                
                guard let article = article as? NSDictionary else{
                    continue
                }
                
                guard let publishedAt = article["publishedAt"] as? String,
                    let author = article["author"] as? String,
                    let title = article["title"] as? String,
                    let description = article["description"] as? String,
                    let url = article["url"] as? String,
                    let urlToImage = article["urlToImage"] as? String else{
                        continue
                }
                
                let articleObj = Article(publishedAt: publishedAt,
                                         author: author,
                                         title: title,
                                         description: description,
                                         url: url,
                                         urlToImage: urlToImage)
                
                articlesObjects.append(articleObj)
            }
            completion(articlesObjects)
        
        }
    }
}
