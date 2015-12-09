//
//  Review.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit


class Review {
    
    var author:String
    var location:String
    var title:String
    var body:String
    var rating:Int
    
    init?(author:String, location:String, title:String, body:String, rating:Int) {
        self.author = author
        self.location = location
        self.title = title
        self.body = body
        self.rating = rating
        
        if author.isEmpty || title.isEmpty {
            return nil
        }
    }
    
}