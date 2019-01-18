//
//  VideoCell.swift
//
//
//  Created by Zsebe Akos on 1/9/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit
import MapKit

class StationCell: BaseCell{
    
    var station: Station? {
        didSet {
            titleLabel.text = station?.stationName
            subtitleLabel.text = station?.address
            
            bikesNumberLabel.text = "Bikes "
            if let ocuppiedSpots = station?.ocuppiedSpots {
                bikesNumberLabel.text.append(String(ocuppiedSpots))
            }
            
            parkingNumberLabel.text = "Parkings "
            if let emptySpots = station?.emptySpots {
                parkingNumberLabel.text.append(String(emptySpots))
            }
            
            activeImageView.layer.borderColor = statusIconSelector(station: station!).cgColor
        }
    }
    
    let activeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 14
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.colorActive().cgColor
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "map_icon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Horea - Gara"
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UITextView = {
        let label = UITextView()
        label.text = "Horea - la Gara"
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bikesNumberLabel: UITextView = {
        let label = UITextView()
        label.text = "Bikes 5"
        label.textColor = UIColor.gray
        label.textContainerInset = UIEdgeInsetsMake(0, -24, 0, 0)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let parkingNumberLabel: UITextView = {
        let label = UITextView()
        label.text = "Parkings 15"
        label.textColor = UIColor.gray
        label.textContainerInset = UIEdgeInsetsMake(0, -64, 0, 0)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    override func setupViews(){
        addSubview(separatorView)
        addSubview(activeImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(bikesNumberLabel)
        addSubview(parkingNumberLabel)
        addSubview(mapImageView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(28)]-16-[v1]-48-[v2(24)]-16-|", views: activeImageView,titleLabel,mapImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0(46)]", views: titleLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0]", views: mapImageView)
        addConstraintsWithFormat(format: "V:|-16-[v0(28)]-16-[v1(1)]|", views: activeImageView,separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // top constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .top, relatedBy: .equal, toItem: separatorView, attribute: .top, multiplier: 1, constant: -28))
        // left constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .left, relatedBy: .equal, toItem: activeImageView, attribute: .left, multiplier: 1, constant: 8))
        // right constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .right, relatedBy: .equal, toItem: parkingNumberLabel, attribute: .right, multiplier: 1, constant: -30))
        // height constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
//        // bikesNumberLabel
//        // top constraint
        addConstraint(NSLayoutConstraint(item: bikesNumberLabel, attribute: .top, relatedBy: .equal, toItem: mapImageView, attribute: .bottom, multiplier: 1, constant: 8))
//        // left constraint
        addConstraint(NSLayoutConstraint(item: bikesNumberLabel, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
//        // right constraint
        addConstraint(NSLayoutConstraint(item: bikesNumberLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
//        // height constraint
        addConstraint(NSLayoutConstraint(item: bikesNumberLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // parkingNumberLabel
        // top constraint
        addConstraint(NSLayoutConstraint(item: parkingNumberLabel, attribute: .top, relatedBy: .equal, toItem: bikesNumberLabel, attribute: .bottom, multiplier: 1, constant: 4))
        // left constraint
        addConstraint(NSLayoutConstraint(item: parkingNumberLabel, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        // right constraint
        addConstraint(NSLayoutConstraint(item: parkingNumberLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
        // height constraint
        addConstraint(NSLayoutConstraint(item: parkingNumberLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openInMap))
        mapImageView.isUserInteractionEnabled = true
        mapImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func openInMap(){
        let latitude = CLLocationDegrees((self.station?.latitude!)!)
        let longitude = CLLocationDegrees((self.station?.longitude!)!)
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.station?.stationName
        mapItem.openInMaps(launchOptions: options)
    }
    
    private func statusIconSelector(station: Station) -> UIColor{
        if (station.status?.contains("Functional"))!{
            if(station.statusType == "Online") {
                return UIColor.colorActive()
            }
            if (station.statusType == "Suprapopulated") {
                return UIColor.colorSuprapopulated()
            }
            if (station.statusType == "Subpopulated") {
                return UIColor.colorUnderpopulated()
            }
            else if (station.statusType == "Offline") {
                return UIColor.colorOffline()
            }
        }
        return UIColor.colorNotWorking()
    }
}
