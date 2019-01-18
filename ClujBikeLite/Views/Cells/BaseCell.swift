//
//  BaseCell.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/11/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//
import UIKit

class BaseCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
