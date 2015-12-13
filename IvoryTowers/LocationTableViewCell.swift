//
//  LocationTableViewCell.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
