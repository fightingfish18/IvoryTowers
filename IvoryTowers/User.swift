//
//  User.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit


class User {
    
    var id: String
    
    init?(id: String) {
        self.id = id
        if id.isEmpty {
            return nil
        }
    }
}
