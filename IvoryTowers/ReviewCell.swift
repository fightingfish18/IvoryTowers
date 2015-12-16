//
//  ReviewCell.swift
//  IvoryTowers
//
//  Created by studentuser on 12/15/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var score: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
