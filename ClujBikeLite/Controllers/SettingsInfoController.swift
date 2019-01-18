//
//  SettingsInfoController.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/15/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class SettingsInfoController: UIViewController{
    
    
    let infoLabel: UITextView = {
        let bl = UITextView()
        bl.text = "Info"
        bl.textColor = UIColor.mainColor()
        bl.font = UIFont.systemFont(ofSize: 23)
        bl.backgroundColor = .white
        return bl
    }()
    
    let activeImageView: UIImageView = {
        return bubble(color: UIColor.colorActive())
    }()
    
    let offlineImageView: UIImageView = {
        return bubble(color:UIColor.colorOffline())
    }()
    
    let notWorkingImageView: UIImageView = {
        return bubble(color:UIColor.colorNotWorking())
    }()
    
    let overPopulatedImageView: UIImageView = {
        return bubble(color:UIColor.colorSuprapopulated())
    }()
    
    let underPopulatedImageView: UIImageView = {
        return bubble(color:UIColor.colorUnderpopulated())
    }()
    
    static func bubble(color: UIColor) -> UIImageView{
        let imageView = UIImageView()
        imageView.layer.borderWidth = 14
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = color.cgColor
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
        return imageView
    }
    
    let activeLabel: UILabel = {
        return bubbleText(text: "Active")
    }()
    
    let offlineLabel: UILabel = {
        return bubbleText(text: "Offline")
    }()
    
    let notWorkingLabel: UILabel = {
        return bubbleText(text: "Not Working")
    }()
    
    let overPopulatedLabel: UILabel = {
        return bubbleText(text: "Overpopulated")
    }()
    
    let underPopulatedLabel: UILabel = {
        return bubbleText(text: "Underpopulated")
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
        view.addSubview(activeImageView)
        view.addSubview(offlineImageView)
        view.addSubview(notWorkingImageView)
        view.addSubview(overPopulatedImageView)
        view.addSubview(underPopulatedImageView)
        view.addSubview(activeLabel)
        view.addSubview(offlineLabel)
        view.addSubview(notWorkingLabel)
        view.addSubview(overPopulatedLabel)
        view.addSubview(underPopulatedLabel)
        
        
        view.addConstraintsWithFormat(format: "H:|-14-[v0]|", views: infoLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]", views: activeImageView,activeLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]", views: offlineImageView,offlineLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]", views: notWorkingImageView,notWorkingLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]", views: overPopulatedImageView,overPopulatedLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]", views: underPopulatedImageView,underPopulatedLabel)
        
        view.addConstraintsWithFormat(format: "V:|[v0(50)]-16-[v1(28)]-16-[v2(28)]-16-[v3(28)]-16-[v4(28)]-16-[v5(28)]", views: infoLabel,activeImageView, offlineImageView, notWorkingImageView,overPopulatedImageView,underPopulatedImageView)
        
        
        // activeLabel/
        self.view.addConstraint(NSLayoutConstraint(item: activeLabel, attribute: .top, relatedBy: .equal, toItem: infoLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: activeLabel, attribute: .height, relatedBy: .equal, toItem: activeLabel, attribute: .height, multiplier: 0, constant: 28))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: offlineLabel, attribute: .top, relatedBy: .equal, toItem: activeLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: offlineLabel, attribute: .height, relatedBy: .equal, toItem: offlineLabel, attribute: .height, multiplier: 0, constant: 28))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: notWorkingLabel, attribute: .top, relatedBy: .equal, toItem: offlineLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: notWorkingLabel, attribute: .height, relatedBy: .equal, toItem: notWorkingLabel, attribute: .height, multiplier: 0, constant: 28))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: overPopulatedLabel, attribute: .top, relatedBy: .equal, toItem: notWorkingLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: overPopulatedLabel, attribute: .height, relatedBy: .equal, toItem: overPopulatedLabel, attribute: .height, multiplier: 0, constant: 28))
        // offlineLabel/
        self.view.addConstraint(NSLayoutConstraint(item: underPopulatedLabel, attribute: .top, relatedBy: .equal, toItem: overPopulatedLabel, attribute: .bottom, multiplier: 1, constant: 16))
        self.view.addConstraint(NSLayoutConstraint(item: underPopulatedLabel, attribute: .height, relatedBy: .equal, toItem: underPopulatedLabel, attribute: .height, multiplier: 0, constant: 28))
        
        
    }
    
}
