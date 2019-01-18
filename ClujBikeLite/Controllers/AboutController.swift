//
//  AboutController.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/17/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class AboutController: UIViewController {

    let infoLabel: UITextView = {
        let bl = UITextView()
        bl.text = "Developers"
        bl.textColor = UIColor.mainColor()
        bl.font = UIFont.systemFont(ofSize: 23)
        bl.backgroundColor = .white
        return bl
    }()
    
    let akoImageView: UIImageView = {
        return bubble(imageName: "akos")
    }()
    
    let davidImageView: UIImageView = {
        return bubble(imageName: "david")
    }()
    
    let facoImageView: UIImageView = {
        return bubble(imageName: "feco")
    }()
    
    static func bubble(imageName: String) -> UIImageView{
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }
    
    let akosLabel: UILabel = {
        return bubbleText(text: "Zsebe Akos")
    }()
    
    let davidLabel: UILabel = {
        return bubbleText(text: "Vincze David")
    }()
    
    let fecoLabel: UILabel = {
        return bubbleText(text: "Solyom Ferencz")
    }()
    
    static func bubbleText(text: String) -> UILabel{
        let bl = UILabel()
        bl.text = text
        bl.textColor = UIColor.black
        bl.font = UIFont.systemFont(ofSize: 20)
        bl.backgroundColor = .white
        return bl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(infoLabel)
        view.addSubview(akoImageView)
        view.addSubview(davidImageView)
        view.addSubview(facoImageView)
        view.addSubview(akosLabel)
        view.addSubview(davidLabel)
        view.addSubview(fecoLabel)
        
        
        view.addConstraintsWithFormat(format: "H:|-14-[v0]|", views: infoLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(40)]-16-[v1]", views: akoImageView,akosLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(40)]-16-[v1]", views: davidImageView,davidLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(40)]-16-[v1]", views: facoImageView,fecoLabel)
        
        view.addConstraintsWithFormat(format: "V:|[v0(50)]-16-[v1(40)]-16-[v2(40)]-16-[v3(40)]", views: infoLabel,akoImageView, davidImageView, facoImageView)
        
        
        // activeLabel/
        self.view.addConstraint(NSLayoutConstraint(item: akosLabel, attribute: .top, relatedBy: .equal, toItem: infoLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: akosLabel, attribute: .height, relatedBy: .equal, toItem: akosLabel, attribute: .height, multiplier: 0, constant: 40))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: davidLabel, attribute: .top, relatedBy: .equal, toItem: akosLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: davidLabel, attribute: .height, relatedBy: .equal, toItem: davidLabel, attribute: .height, multiplier: 0, constant: 40))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: fecoLabel, attribute: .top, relatedBy: .equal, toItem: davidLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: fecoLabel, attribute: .height, relatedBy: .equal, toItem: fecoLabel, attribute: .height, multiplier: 0, constant: 40))
        
        
    }



}
