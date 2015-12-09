//
//  Location.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit


class Location {
    
    var name:String
    var longitude:Int
    var latitude:Int
    var imageName:String
    var description:String
    var categories:[String]
    var departments:[String]
    var abbreviation:String
    
    init?(name:String, longitude:Int, latitude:Int, imageName:String, description:String, categories:[String], departments:[String], abbreviation:String) {
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.imageName = imageName
        self.description = description
        self.categories = categories
        self.departments = departments
        self.abbreviation = abbreviation
        
        if name.isEmpty {
            return nil
        }
    }
    
}
