//
//  RatingControl.swift
//  IvoryTowers
//
//  Created by iGuest on 12/8/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    
    var stars = 5

    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped", forControlEvents: .TouchDown)
        
            ratingButtons += [button]
            
            addSubview(button)
        
        }
    }
    
    override func layoutSubviews(){
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
         updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            
            button.selected = index < rating
        }
    }
}
