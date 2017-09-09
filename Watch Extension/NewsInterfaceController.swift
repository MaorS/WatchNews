//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Maor Shams on 08/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import WatchKit
import UIKit
import SDWebImage

class NewsInterfaceController: WKInterfaceController {
    
    @IBOutlet var newsTable: WKInterfaceTable!
    
    var articles = [Article](){
        didSet{
            if !articles.isEmpty{
                setupTable()
            }
        }
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let context = context as? [Article]{
            self.articles = context
        }
    }
    
 
    func setupTable(){
        self.newsTable.setNumberOfRows(articles.count, withRowType: "cell")
        for i in 0..<articles.count{
            
            
            let row = self.newsTable.rowController(at: i) as! ArticleController
            let article = articles[i]
            
            row.itemDateLabel.setText(formattedDate(from: article.publishedAt))
            row.itemTitleLabel.setText(article.title)
            
        }
    
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return articles[rowIndex]
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(rowIndex)
    }
    
    func formattedDate(from date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, HH:mm"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
