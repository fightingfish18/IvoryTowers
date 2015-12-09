//
//  User.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit


class User {
    
    var facebookID:String
    
    init?(facebookID:String) {
        self.facebookID = facebookID
        
        if facebookID.isEmpty {
            return nil
        }
    }
}
