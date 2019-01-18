//
//  MenuCell.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/12/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class MenuCell: BaseCell{
    
    let textView:UILabel = {
        let label = UILabel()
        label.text  = "ALL"
        label.textColor = UIColor.tabBarTextColor()
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            textView.highlightedTextColor = isHighlighted ? UIColor.white : UIColor.tabBarTextColor()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            textView.highlightedTextColor = isSelected ? UIColor.white : UIColor.tabBarTextColor()
        }
    }
    
    override func setupViews(){
        super.setupViews()
        
        addSubview(textView)
        addConstraintsWithFormat(format: "H:[v0]", views: textView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: textView)
        
        addConstraint(NSLayoutConstraint(item: textView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: textView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}

