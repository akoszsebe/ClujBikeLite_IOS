//
//  SettingCell.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/13/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let nameLabael: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabael)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]|", views: nameLabael)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabael)
    
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabael.textColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    
    
}
